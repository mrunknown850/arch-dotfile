import QtQuick
import ".."

Item {
    id: hitbox
    width: layout.implicitWidth
    height: parent.parent.height
    HoverHandler {
        id: hoverHandler
    }

    Rectangle {
        id: root

        property bool isOpened: false

        anchors.centerIn: parent
        implicitWidth: layout.implicitWidth
        implicitHeight: layout.implicitHeight

        radius: 5
        color: hoverHandler.hovered || isOpened ? Qt.alpha(Theme.colorOnSurface, 0.1) : Qt.alpha(Theme.colorOnSurface, 0)
        Behavior on color {
            ColorAnimation {
                duration: 100
            }
        }

        VectorIcon {
            id: layout
            anchors.centerIn: parent
            size: hitbox.parent.parent.height * 0.8
            fillColor: Theme.colorOnSurface
            iconSrc: "../assets/tray/chevron.svg"
            rotation: root.isOpened ? 180 : 0
            Behavior on rotation {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.OutCubic
                }
            }
        }
    }

    MouseArea {
        anchors.fill: hitbox
        onClicked: root.isOpened = !root.isOpened
    }
}
