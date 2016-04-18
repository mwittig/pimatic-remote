# pimatic-remote plugin
module.exports = (env) ->

  _ = env.require 'lodash'
  Messenger = require('./remote-connection')(env)
  commons = require('pimatic-plugin-commons')(env)
  deviceConfigTemplates = {
    "switch": {
      id: "remote-switch-"
      name: "Remote Switch "
      class: "PimaticRemoteSwitch"
    }
  }

  # ###PimaticRemotePlugin class
  class PimaticRemotePlugin extends env.plugins.Plugin

    init: (app, @framework, @config) =>
      @messenger = new Messenger(@config, @)
      @debug = @config.debug || false
      @base = commons.base @, 'Plugin'

      # register devices
      deviceConfigDef = require("./device-config-schema")
      for key, device of deviceConfigTemplates
        do (key, device) =>
          className = device.class
          # convert camel-case classname to kebap-case filename
          filename = className.replace(/([a-z])([A-Z])/g, '$1-$2').toLowerCase();
          classType = require('./devices/' + filename)(env)
          @base.debug "Registering device class #{className}"
          @framework.deviceManager.registerDeviceClass(className, {
            configDef: deviceConfigDef[className],
            createCallback: (config, lastState) =>
              new classType(config, @, lastState)
          })

      # auto-discovery
      @framework.deviceManager.on('discover', (eventData) =>
        @framework.deviceManager.discoverMessage 'pimatic-remote', 'Searching for devices'

#        tbd
      )

  # ###Finally
  # Create a instance of plugin
  return new PimaticRemotePlugin