Timeline Service
================

Capture and display user behavior in your application. Use this information for
dashboards, business intelligence, or debugging.

Requirements
------------

1. PostgreSQL 9.2 or above (for the JSON column type).
2. Rails 4.0.0b1 or above (for support of the JSON column type).

TODO
----

* Accept JSON HTTP requests to record entries.
* Accept UDP packets to record entries with 0 latency.
* Build a Ruby client wrapper to interact with the service.
* Build a Node.js client wrapper to interact with the service.
* Provide some kind of configuration to map action (e.g., "page-create") to a
  meaningful description (e.g., "Created a page")
* Provide some kind of mechanism ([Liquid template][liquid], perhaps?) to map
  the metadata to useful data (e.g., accepting the ID and mapping to a URL to
  the page in question).
* Consider how to secure access to the service.

[liquid]:http://liquidmarkup.org

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


