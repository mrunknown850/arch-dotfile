import QtQuick
import Quickshell
import ".."

PopupWindow {
    id: root

    required property Item target
    property int edge: Edges.Bottom
    property string text: ""

    property color backgroundColor: Theme.surface
    property color foregroundColor: Theme.colorOnSurface

    property int radius: 5

    property int delay: 300
    property int offset: 8

    visible: false

    property int horizontalPadding: 10
    property int verticalPadding: 6

    implicitWidth: tooltipText.implicitWidth + horizontalPadding * 2
    implicitHeight: tooltipText.implicitHeight + verticalPadding * 2

    color: "transparent"

    anchor {
        item: target
        edges: root.edge
    }

    Rectangle {
        anchors.fill: parent

        radius: root.radius
        color: root.backgroundColor
        border.width: 1

        Text {
            id: tooltipText

            anchors.centerIn: parent

            text: root.text
            color: root.foregroundColor

            font.pixelSize: Theme.fontSize
            font.family: Theme.fontFamily
        }

        opacity: root.visible ? 1 : 0

        Behavior on opacity {
            NumberAnimation {
                duration: 200
            }
        }
    }

    function startHover() {
        timer.start();
    }
    function stopHover() {
        timer.stop();
        root.visible = false;
    }

    Timer {
        id: timer

        interval: root.delay
        onTriggered: root.visible = true
    }
}
