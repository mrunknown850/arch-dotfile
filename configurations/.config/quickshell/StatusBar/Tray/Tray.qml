import QtQuick
import Quickshell
import "../.."
import ".."

Item {
    id: hitbox

    property bool isOpened: false
    implicitWidth: layout.implicitWidth
    implicitHeight: parent.parent.height
    HoverHandler {
        id: hoverHandler
    }

    Rectangle {
        id: root

        anchors.centerIn: parent
        implicitWidth: layout.implicitWidth
        implicitHeight: layout.implicitHeight

        radius: 5
        color: hoverHandler.hovered || hitbox.isOpened ? Qt.alpha(Theme.colorOnSurface, 0.1) : Qt.alpha(Theme.colorOnSurface, 0)
        Behavior on color {
            ColorAnimation {
                duration: 100
            }
        }

        VectorIcon {
            id: layout
            anchors.centerIn: parent
            size: hitbox.implicitHeight * 0.8
            fillColor: Theme.colorOnSurface
            iconSrc: "../assets/tray/chevron.svg"
            rotation: hitbox.isOpened ? 180 : 0
            Behavior on rotation {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.OutCubic
                }
            }
        }
    }

    TrayMenu {
        target: hitbox
        visible: hitbox.isOpened
    }

    MouseArea {
        anchors.fill: hitbox
        onClicked: hitbox.isOpened = !hitbox.isOpened
    }
}
