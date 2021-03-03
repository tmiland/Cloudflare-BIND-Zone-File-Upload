# Cloudflare BIND Zone File Upload

 A quick script to upload a BIND zone file to Cloudflare

### *WARNING: THIS WILL DELETE ALL OF YOUR CURRENT DNS RECORDS FOR YOUR DOMAIN!*

### Tip:

Export your current DNS records before using this script.

Go to Cloudflare, choose your domain and go to the DNS tab,
then the advanced button -> Export DNS records.

### Why?

I wanted an easy way to "sync" DNS records since there isn't a way to do that currently with [Virtualmin](https://github.com/virtualmin/virtualmin-gpl).

### Issues?

Not all records are valid. (See sample output below)

## Example usage

```bash
 ./cloudflare_BIND_upload.sh email@domain.com auth-key zone-id domain.com false
 ```

- The script will search /var for domain.com.hosts file so that it'll match the domain you enter in the cmd, and copy it to the current dir as domain.com.txt

<details><summary>sample output</summary><p>

```bash

 {"result":{"id":"xxxxxxxxxxxxxxxxxxxxxxxxxx"},"success":true,"errors":[],"messages":[]}{"result":{"id":"xxxxxxxxxxxxxxxxxxxxxxxxxx"},"success":true,"errors":[],"messages":[]}{"result":{"id":"xxxxxxxxxxxxxxxxxxxxxxxxxx"},"success":true,"errors":[],"messages":[]}{"result":{"id":"xxxxxxxxxxxxxxxxxxxxxxxxxx"},"success":true,"errors":[],"messages":[]}{"result":{"id":"xxxxxxxxxxxxxxxxxxxxxxxxxx"},"success":true,"errors":[],"messages":[]}{"result":{"id":"xxxxxxxxxxxxxxxxxxxxxxxxxx"},"success":true,"errors":[],"messages":[]}{"result":{"id":"xxxxxxxxxxxxxxxxxxxxxxxxxx"},"success":true,"errors":[],"messages":[]}{"result":{"id":"xxxxxxxxxxxxxxxxxxxxxxxxxx"},"success":true,"errors":[],"messages":[]}{"result":{"id":"xxxxxxxxxxxxxxxxxxxxxxxxxx"},"success":true,"errors":[],"messages":[]}{"result":{"id":"xxxxxxxxxxxxxxxxxxxxxxxxxx"},"success":true,"errors":[],"messages":[]}{"result":{"id":"xxxxxxxxxxxxxxxxxxxxxxxxxx"},"success":true,"errors":[],"messages":[]}{"result":{"id":"xxxxxxxxxxxxxxxxxxxxxxxxxx"},"success":true,"errors":[],"messages":[]}{"result":{"id":"xxxxxxxxxxxxxxxxxxxxxxxxxx"},"success":true,"errors":[],"messages":[]}{"result":{"id":"xxxxxxxxxxxxxxxxxxxxxxxxxx"},"success":true,"errors":[],"messages":[]}{"result":{"id":"xxxxxxxxxxxxxxxxxxxxxxxxxx"},"success":true,"errors":[],"messages":[]}{"result":{"id":"xxxxxxxxxxxxxxxxxxxxxxxxxx"},"success":true,"errors":[],"messages":[]}{"result":{"id":"xxxxxxxxxxxxxxxxxxxxxxxxxx"},"success":true,"errors":[],"messages":[]}{"result":{"id":"xxxxxxxxxxxxxxxxxxxxxxxxxx"},"success":true,"errors":[],"messages":[]}{"result":{"recs_added":18,"recs_added_by_type":{"A":9,"DNSKEY":2,"DS":2,"MX":1,"NS":1,"TXT":3},"total_records_parsed":19},"success":true,"errors":[],"messages":[{"code":9002,"message":"domain.com.: DNS record type is invalid."},{"code":9002,"message":"domain.com.: DNS record type is invalid."},{"code":9002,"message":"domain.com.: DNS record type is invalid."},{"code":9002,"message":"domain.com.: DNS record type is invalid."},{"code":9002,"message":"domain.com.: DNS record type is invalid."},{"code":9002,"message":"domain.com.: DNS record type is invalid."},{"code":9002,"message":"domain.com.: DNS record type is invalid."},{"code":9002,"message":"domain.com.: DNS record type is invalid."},{"code":9002,"message":"domain.com.: DNS record type is invalid."},{"code":9002,"message":"_dmarc.domain.com.: DNS record type is invalid."},{"code":9002,"message":"_dmarc.domain.com.: DNS record type is invalid."},{"code":9002,"message":"_dmarc.domain.com.: DNS record type is invalid."},{"code":9002,"message":"202101._domainkey.domain.com.: DNS record type is invalid."},{"code":9002,"message":"202101._domainkey.domain.com.: DNS record type is invalid."},{"code":9002,"message":"202101._domainkey.domain.com.: DNS record type is invalid."},{"code":9002,"message":"autoconfig.domain.com.: DNS record type is invalid."},{"code":9002,"message":"autoconfig.domain.com.: DNS record type is invalid."},{"code":9002,"message":"autoconfig.domain.com.: DNS record type is invalid."},{"code":9002,"message":"autodiscover.domain.com.: DNS record type is invalid."},{"code":9002,"message":"autodiscover.domain.com.: DNS record type is invalid."},{"code":9002,"message":"autodiscover.domain.com.: DNS record type is invalid."},{"code":9002,"message":"ftp.domain.com.: DNS record type is invalid."},{"code":9002,"message":"ftp.domain.com.: DNS record type is invalid."},{"code":9002,"message":"ftp.domain.com.: DNS record type is invalid."},{"code":9002,"message":"localhost.domain.com.: DNS record type is invalid."},{"code":9002,"message":"localhost.domain.com.: DNS record type is invalid."},{"code":9002,"message":"localhost.domain.com.: DNS record type is invalid."},{"code":9002,"message":"m.domain.com.: DNS record type is invalid."},{"code":9002,"message":"m.domain.com.: DNS record type is invalid."},{"code":9002,"message":"m.domain.com.: DNS record type is invalid."},{"code":9002,"message":"mail.domain.com.: DNS record type is invalid."},{"code":9002,"message":"mail.domain.com.: DNS record type is invalid."},{"code":9002,"message":"mail.domain.com.: DNS record type is invalid."},{"code":9002,"message":"ns1.domain.com.: DNS record type is invalid."},{"code":9002,"message":"ns1.domain.com.: DNS record type is invalid."},{"code":9002,"message":"ns1.domain.com.: DNS record type is invalid."},{"code":9002,"message":"www.domain.com.: DNS record type is invalid."},{"code":9002,"message":"www.domain.com.: DNS record type is invalid."},{"code":9002,"message":"www.domain.com.: DNS record type is invalid."},{"code":81055,"message":"mail.domain.com: Non-NS records with that host already exist."}]}#
 
 ```
</p></details>

## Credits
- Code is customized from these sources:
[Delete all DNS records for specified zone](https://gist.github.com/slayer/442fa2fffed57f8409e0b23bd0673a92)
[Cloudflare API v4 Documentation](https://api.cloudflare.com/)

## Donations 
- [PayPal me](https://paypal.me/milanddata)
- [BTC] : 33mjmoPxqfXnWNsvy8gvMZrrcG3gEa3YDM

## Web Hosting

Sign up for web hosting using this link, and receive $100 in credit over 60 days.

[DigitalOcean](https://m.do.co/c/f1f2b475fca0)

#### Disclaimer 

*** ***Use at own risk*** ***

### License

[![MIT License Image](https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/MIT_logo.svg/220px-MIT_logo.svg.png)](https://github.com/tmiland/Invidious-Updater/blob/master/LICENSE)

[MIT License](https://github.com/tmiland/Invidious-Updater/blob/master/LICENSE)
