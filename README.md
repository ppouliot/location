location
========

This module contacts an [on-line geolocation service](http://ipstack.com) and stores
several facts about the geographical location of the node.

Warning
-------

*Do not retrieve facts from untrusted sources.* `location` does not
do any sanity checking on the retrieved location information.

By default, this module previously attempted to retrieve the node's location
using the JSON service at http://freegeoip.net.  This free json api service has been 
replaced by http://ipstack.com. This free service is
limited to 10000 requests per month, so you should not use it in
massively elastic or particularly large environments.

However, the software running FreeGeoIP is freely available on
[GitHub,](https://github.com/apilayer/freegeoip/)
enabling you to run your own geo-location web service if you so
choose.

Example
-------

To fetch geo-location information from FreeGeoIP, just put the
following in your manifest:

    include location

This will fetch your node's locative information from
http://api.ipstack.com/check?access_key=<YOUR_ACCESS_KEY> and store it in
/etc/facter/facts.d/location.json.

If you run your own service, or want to specify a non-default filename
for the downloaded facts, you can do so as follows:

    class { 'location':
        url => 'http://location.example.com/json/',
        filename => 'whereami.json'
    }

Note that in order to be properly parsed by `facter-dot-d`,
Your `filename` must end in `.json`.

Normally, the lookup will occur only once for every node.
In order to purge and refresh a node's location information, delete
the fact file and wait for the next agent run.

License
-------

ASL 2.0.

Contact
-------

Contact `puppetforge@hastexo.com` for any comments and questions about
this module.


Support
-------

Please report issues on [GitHub](https://github.com/ppouliot/puppet-location/issues).
