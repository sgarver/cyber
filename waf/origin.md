# Origin Server IPs

> how to get origin server ip when a website is using cloudflare waf (Grok 3)

Getting the origin server IP of a website protected by Cloudflare's Web Application Firewall (WAF) can be tricky because Cloudflare acts as a reverse proxy, masking the real server IP. However, there are some methods you can try to uncover it, though success isn’t guaranteed due to Cloudflare’s robust protection mechanisms. Here’s a breakdown of potential approaches:

1. Check Historical DNS Records
Before a site started using Cloudflare, its DNS records might have pointed directly to the origin IP. You can use tools like SecurityTrails, DNSDumpster, or ViewDNS.info to look up historical DNS data (e.g., A records) for the domain. If the site recently switched to Cloudflare, you might find the original IP this way.

2. Look for Subdomains Not Behind Cloudflare Sometimes, not all subdomains are proxied through Cloudflare. Use tools like subfinder, Amass, or dnsdumpster to enumerate subdomains, then perform a DNS lookup (e.g., with nslookup or dig) on each. If a subdomain resolves to an IP that isn’t a Cloudflare IP (you can check Cloudflare’s IP ranges online), it might be hosted on the same server as the main site.

3. Inspect Email Headers
If the website sends emails (e.g., via a contact form or newsletter), the email headers might reveal the origin server IP. Send an email or trigger one from the site, then examine the "Received" lines in the raw email headers. Look for IPs that don’t belong to Cloudflare or common mail services—these could point to the origin server.

4. SSL Certificate Analysis
Use a tool like censys.io or crt.sh to search for SSL certificates associated with the domain. Sometimes, certificates are issued to the origin server rather than Cloudflare. You can also use openssl to connect directly:  

```sh
openssl s_client -connect example.com:443
```

Check the certificate details or try connecting to non-Cloudflare IPs found elsewhere to see if they match the site’s behavior.
Bypass via Misconfigurations
Some sites misconfigure Cloudflare, leaving the origin IP exposed. For example:  
Direct IP Access: If you find a candidate IP (e.g., from historical records), try accessing it directly in your browser. If it loads the site without Cloudflare’s interference, you’ve likely found the origin.  
Server-Side Requests: If the site interacts with external services (e.g., an API or webhook), those services might log the origin IP instead of Cloudflare’s.

6. Crimeflare or Similar Databases
There are unofficial tools and databases like "Crimeflare" that attempt to catalog origin IPs behind Cloudflare. These rely on leaks or misconfigurations reported by users. Search for the domain in such a tool, but be cautious—results may be outdated or inaccurate.

7. Network Traffic Analysis
If you control a client accessing the site, use a tool like Wireshark to monitor traffic. While Cloudflare encrypts most connections, poorly configured servers might leak the origin IP during initial handshakes or redirects. This is rare and usually requires specific vulnerabilities.

## Important Notes:

- Cloudflare’s Protection: If the site owner properly configured Cloudflare (e.g., full DNS proxying, no direct IP leaks), these methods might fail. Cloudflare’s job is to obscure the origin IP, and it’s good at it.

- Legal/Ethical Considerations: Attempting to bypass security measures could violate terms of service or local laws, depending on your intent and jurisdiction. Use this knowledge responsibly, like for security research with permission.

