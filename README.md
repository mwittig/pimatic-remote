# pimatic-remote

Pimatic Plugin to control devices of a remote Pimatic Server. To date, this is just a proof concept which implements
a remote switch.

## Configuration

### Plugin Configuration

    {
      "plugin": "remote",
      "debug": true,
      "url": "http://pimatic",
      "username": "XXXXXX",
      "password": "XXXXXX"
    }

### Device Configuration

At the moment it is only possible to setup a switch. The property `remoteId` refers to the id of the remote device.

    {
      "id": "remote-1",
      "remoteId": "edimax-plug",
      "class": "PimaticRemoteSwitch",
      "name": "Remote Edimax Plug"
    }

## History

See [Release History](https://github.com/mwittig/pimatic-remote/blob/master/HISTORY.md).

## License 

Copyright (c) 2015-2016, Marcus Wittig and contributors. All rights reserved.

[AGPL-3.0](https://github.com/mwittig/pimatic-remote/blob/master/LICENSE)
