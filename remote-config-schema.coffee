module.exports = {
  title: "pimatic-remote plugin config options"
  type: "object"
  properties:
    debug:
      description: "Debug mode. Writes debug message to the pimatic log"
      type: "boolean"
      default: false
    url:
      description: "The URL of the remote pimatic server"
      type: "string"
    username:
      description: "The username to be used for the authentication with the remote pimatic server"
      type: "string"
    password:
      description: "The password to be used for the authentication with the remote pimatic server"
      type: "string"
}