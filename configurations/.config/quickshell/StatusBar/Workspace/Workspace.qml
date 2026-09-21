// Individual workspace item
import Quickshell.Hyprland
import QtQuick
import "../.."

Item {
    id: root

    required property HyprlandWorkspace workspace
    readonly property bool active: workspace.active
    readonly property bool occupied: workspace.toplevels.values.length > 0

    implicitWidth: parent.parent.height * 0.6
    implicitHeight: parent.parent.height

    Text {
        anchors.centerIn: parent

        text: root.workspace.name

        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize
        color: root.active ? Theme.colorOnSurface : root.occupied ? Theme.colorOnBackground : Theme.outline
    }

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom

        width: root.active ? parent.parent.height * 0.65 : 0
        height: 2
        color: Theme.outline

        Behavior on width {
            NumberAnimation {
                duration: 150
                easing.type: Easing.OutCubic
            }
        }
    }
    MouseArea {
        anchors.fill: parent

        onClicked: root.workspace.activate()
    }
}
