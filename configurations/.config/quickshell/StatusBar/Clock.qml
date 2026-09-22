import QtQuick
import Quickshell
import ".."

Rectangle {
    id: root

    property int panelSize: Math.round(Theme.fontSize * 1.8)

    implicitWidth: text.implicitWidth * 1.1
    implicitHeight: text.implicitHeight * 1.5

    radius: 5
    color: hoverHandler.hovered ? Qt.alpha(Theme.colorOnSurface, 0.1) : Qt.alpha(Theme.colorOnSurface, 0)
    Behavior on color {
        ColorAnimation {
            duration: 100
        }
    }
    HoverHandler {
        id: hoverHandler
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
            // 2. Qualify the enum with SystemClock
            precision: SystemClock.Seconds
        }
    }
}
