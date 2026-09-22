import QtQuick
import Quickshell
import ".."

Item {
    id: hitbox
    width: root.implicitWidth
    height: parent.parent.height
    HoverHandler {
        id: hoverHandler
        onHoveredChanged: {
            if (hovered)
                tooltip.startHover();
            else
                tooltip.stopHover();
        }
    }

    Rectangle {
        id: root

        property int panelSize: Math.round(Theme.fontSize * 1.8)

        anchors.centerIn: parent
        implicitWidth: text.implicitWidth * 1.2
        implicitHeight: hitbox.parent.parent.height * 0.8

        radius: 5
        color: hoverHandler.hovered ? Qt.alpha(Theme.colorOnSurface, 0.1) : Qt.alpha(Theme.colorOnSurface, 0)
        Behavior on color {
            ColorAnimation {
                duration: 100
            }
        }

        Text {
            id: text

            anchors.centerIn: parent
            text: Qt.formatDateTime(clock.date, "hh:mm AP")

            color: Theme.colorOnSurface
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSize
            font.weight: 600

            SystemClock {
                id: clock
                precision: SystemClock.Seconds
            }
        }

        Tooltip {
            id: tooltip
            target: root

            text: Qt.formatDateTime(clock.date, "ddd, dd/MM/yyyy")
        }
    }
}
