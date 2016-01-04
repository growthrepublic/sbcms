# Simple Beacon CMS

SBCMS is an one-click deployment solution for iBeacon content-delivery server.

## Deployment

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/growthrepublic/sbcms/tree/stable)

## API

### Unique Identifier

UUID (Universally Unique IDentifier), Major and Minor parameters – together make up your Beacon’s unique identifier.

Every unique identifier has UUID-**Major**-**Minor** format (ex. 3E3D13BA-64DE-43E3-AF30-17C754ADC8AF-**1234**-**5678**).

### GET /api/beacons

Returns all beacons registered in the application.

Example response:

    [
      {
        "name": "estimote-beacon-25556B57FE6D",
        "model": "estimote-beacon",
        "major": 12345,
        "minor": 67890,
        "uuid": "3E3D13BA-64DE-43E3-AF30-17C754ADC8AF"
      },
      ...
    ]

### GET /api/beacons/:unique_identifier

Returns single Beacon registered in the application.

Example response:

    {
      "name": "estimote-beacon-25556B57FE6D",
      "model": "estimote-beacon",
      "major": 12345,
      "minor": 67890,
      "uuid": "3E3D13BA-64DE-43E3-AF30-17C754ADC8AF"
    }

### GET /api/beacons/:unique_identifier/events

Returns all *active* Events registered to the Beacon.

Example response:

    [
      {
        "type": "text",
        "kind": "enter",
        "payload": "Hello World!",
        "active": true,
        "beacon": {
          "name": "estimote-beacon-25556B57FE6D",
          "model": "estimote-beacon",
          "major": 12345,
          "minor": 67890,
          "uuid": "3E3D13BA-64DE-43E3-AF30-17C754ADC8AF"
        }
        "beacon": {
          "name": "estimote-beacon-25556B57FE6D",
          "model": "estimote-beacon",
          "major": 12345,
          "minor": 67890,
          "uuid": "3E3D13BA-64DE-43E3-AF30-17C754ADC8AF"
        }
      }, 
      ... 
    ]

### GET /api/beacons/:unique_identifier/events/:event_kind

Returns Event object with associated Beacon (if is marked as *active*).

*Available event kinds*: enter, exit, far, near, immediate
*Available payload types*: image, text, url

Example response:

    {
      "type": "text",
      "kind": "enter",
      "payload": "Hello World!",
      "active": true,
      "beacon": {
        "name": "estimote-beacon-25556B57FE6D",
        "model": "estimote-beacon",
        "major": 12345,
        "minor": 67890,
        "uuid": "3E3D13BA-64DE-43E3-AF30-17C754ADC8AF"
      }
      "beacon": {
        "name": "estimote-beacon-25556B57FE6D",
        "model": "estimote-beacon",
        "major": 12345,
        "minor": 67890,
        "uuid": "3E3D13BA-64DE-43E3-AF30-17C754ADC8AF"
      }
    }


## Core Values of SBCMS Development

1. This application must always be easy to deploy by non-technical user and non-backend developer
2. This application must always be easy to use and understand
3. This application must never have confusing behaviours or use confusing interfaces

## Contributing

* Check out the latest master to make sure the feature hasn’t been implemented or the bug hasn’t been fixed yet
* Check out the issue tracker to make sure someone already hasn’t requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don’t break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## License

Copyright (c) 2015 Michał Matyas, Marcin Klocek, Untitled Kingdom Sp. z o.o.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.