module.exports = {
  title: "pimatic-probe device config schemas"
  PimaticRemoteSwitch: {
    title: "Remote Switch"
    description: "Remote Switch"
    type: "object"
    extensions: ["xLink", "xOnLabel", "xOffLabel"]
    properties:
      remoteId:
        description: "The id of the remote switch device"
        type: "string"
  }
}