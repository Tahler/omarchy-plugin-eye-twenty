import QtQuick
import qs.Ui

BarWidget {
  id: root

  readonly property string serviceId: "io.github.tahler.eye-twenty"
  property var reminderService: null
  readonly property bool active: reminderService ? reminderService.active : false

  function loadService() {
    if (!root.bar || !root.bar.shell || typeof root.bar.shell.ensureService !== "function") {
      reminderService = null
      return
    }

    reminderService = root.bar.shell.serviceFor(serviceId) || root.bar.shell.ensureService(serviceId)
  }

  function toggle() {
    root.loadService()
    if (reminderService) reminderService.toggle()
  }

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  Component.onCompleted: root.loadService()
  onBarChanged: root.loadService()

  BarIconButton {
    id: button

    anchors.fill: parent
    bar: root.bar
    text: "󰈈"
    active: root.active
    useActiveColor: false
    dimmed: !root.active
    interactive: root.bar !== null
    tooltipText: root.active
      ? "Pause 20-20-20 reminders"
      : (root.reminderService ? "Resume 20-20-20 reminders" : "20-20-20 service unavailable")
    onPressed: root.toggle()
  }
}
