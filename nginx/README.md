**NGINX Proxy Manager**

1. Add a new Proxy host as you would with any other Docker container
   
   ![Alt text](https://laptopwiki.eu/_media/laptopwiki/guides/docker/meshcentral_npm1.jpg "a title")

2. Don't forget to check Websockets Support
3. In SSL select your certificate, force SSL and enable HTTP/2
4. In the Advanced tab paste the following

**Cloudflare Proxy**

1. This setup works fine through Cloudflare Proxy, assuming
2. Cloudflare Dashboard → yourdomain.tld → SSL/TLS → Overview → FULL
3. This is necessary so that the Cloudflare Proxy and your local certificate match and Cloudflare doesn't try to redirect