import QtQuick
import Quickshell
import Quickshell.Io

Item {
  id: root

  property string omarchyPath: Quickshell.env("OMARCHY_PATH")
  readonly property int notificationDurationMs: 20 * 1000
  readonly property bool active: persisted.active

  function setActive(value) {
    var next = !!value
    if (next === persisted.active) {
      return next ? "enabled" : "disabled"
    }

    persisted.active = next
    return next ? "enabled" : "disabled"
  }

  function toggle() {
    return root.setActive(!root.active)
  }

  function sendReminder() {
    if (!root.active || notificationProcess.running) {
      return
    }

    notificationProcess.command = [
      root.omarchyPath + "/bin/omarchy-notification-send",
      "--app-name", "io.github.tahler.eye-twenty",
      "-u", "normal",
      "20-20-20 eye break",
      "Look at an object 20 feet away for 20 seconds.",
      "-t", String(root.notificationDurationMs)
    ]
    notificationProcess.running = true
  }

  PersistentProperties {
    id: persisted

    reloadableId: "io.github.tahler.eye-twenty"
    property bool active: true
  }

  Process {
    id: notificationProcess
  }

  Timer {
    interval: 20 * 60 * 1000
    running: root.active
    repeat: true
    onTriggered: root.sendReminder()
  }
}
