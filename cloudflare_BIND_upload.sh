#!/usr/bin/env bash

## Author: Tommy Miland (@tmiland) - Copyright (c) 2021

#------------------------------------------------------------------------------#
#
# MIT License
#
# Copyright (c) 2020 Tommy Miland
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
#------------------------------------------------------------------------------#
## Uncomment for debugging purpose
#set -o errexit
#set -o pipefail
#set -o nounset
#set -o xtrace
# Detect absolute and full path as well as filename of this script
cd "$(dirname "$0")" || exit
CURRDIR=$(pwd)
cd - > /dev/null || exit

# Check input
check_input() {
  echo ""
  echo -e "Cloudflare BIND Zone File Upload"
  echo ""
  echo -e "Usage: ./cloudflare_BIND_upload.sh  [Auth-Email] [Auth-Key] [Zone ID] [Domain] [Proxied (true/false)]"
  echo ""
}

INPUT_CHECK=$(check_input)

#check command input
if [[ -z "$1" && -z "$2" && -z "$3" && -z "$4" && -z "$5" ]];
then
  echo -e "${INPUT_CHECK}"
  exit 0
fi

EMAIL=$1
KEY=$2
ZONE_ID=$3
DOMAIN=$4
PROXIED=$5

FILE="$(find /var -name $DOMAIN.hosts)"

if [ ! -f "$FILE" ]; then
    echo "Error! BIND File not found"
    exit 0
fi

cd "${CURRDIR}" || exit
cp -rp $FILE $DOMAIN.txt
DOMAIN_FILE=./$DOMAIN.txt
# Export DNS Records
curl -X GET "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records/export" \
 -H "X-Auth-Email: ${EMAIL}" \
 -H "X-Auth-Key: ${KEY}" \
 -H "Content-Type: application/json" > ./$DOMAIN.txt.bak
 echo "Current DNS records backed up to ./$DOMAIN.txt.bak"
# Get Record IDs
curl -X GET https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records?per_page=500 \
     -H "X-Auth-Email: ${EMAIL}" \
     -H "X-Auth-Key: ${KEY}" \
     -H "Content-Type: application/json" | jq .result[].id |  tr -d '"' | (
  while read id; do
    # Delete ALL records
    curl -X DELETE https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records/${id} \
      -H "X-Auth-Email: ${EMAIL}" \
      -H "X-Auth-Key: ${KEY}" \
      -H "Content-Type: application/json"
  done
  # Upload BIND file to Cloudflare
  curl -X POST "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records/import" \
       -H "X-Auth-Email: ${EMAIL}" \
       -H "X-Auth-Key: ${KEY}" \
       --form "file=@$DOMAIN_FILE" \
       --form "proxied=$PROXIED"
  )
