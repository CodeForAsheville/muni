About
======

`muni` is a simple NextBus API Client library and command line tool for retrieving 
NextBus route and stop prediction information.

Install
=======

```bash
$ gem install muni
```

Client Library
===============

Usage
------

```ruby
# Set NextBus agency (default 'sf-muni')
Muni::Base.set_agency('art')

# Find all routes.
Muni::Route.find(:all)
# => [<Muni::Route tag="F" title="F-Market & Wharves">, ...]

# Find a specific route
r21 = Muni::Route.find(21)
# => <Muni::Route directions=[<Muni::Direction id="21_IB1" name="Inbound to Steuart Terminal" ...

# Get a prediction
r21.outbound.stop_at("Hayes and Laguna").predictions
# => [<Muni::Prediction block="2108" delayed="true" dirTag="21_OB4" epochTime="1306877956823" isDeparture="false" minutes="3" seconds="198" ...
```

CLI
====

`muni` includes a basic command-line interface, mostly as example usage of the client library. See `bin/muni`.

Usage
------

```bash
Tasks:
  muni help [TASK]                         # Describe available tasks or one specific task
  muni list                                # Lists all routes
  muni predict [ROUTE] [DIRECTION] [STOP]  # Retrieve predictions for a route at a specific stop
  muni show [ROUTE_TAG] [DIRECTION]        # Shows a specifc route by name
```

Contributors
============

* [@jeffremer](https://github.com/jeffremer) (maintainer)
* [@gregorym](https://github.com/gregorym)
* [@jameshwang](https://github.com/jameshwang)
* [bf4](https://github.com/bf4)
