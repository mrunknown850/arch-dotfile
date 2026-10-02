import QtQuick
import "../API/"
import ".."

Item {
    id: root

    implicitWidth: layout.implicitWidth
    implicitHeight: parent.parent.height

    readonly property string status: Rclone.status

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: Rclone.sync()
        onContainsMouseChanged: {
            if (containsMouse)
                tooltip.startHover();
            else
                tooltip.stopHover();
        }
    }

    Rectangle {
        anchors.centerIn: parent
        implicitWidth: layout.implicitWidth
        implicitHeight: layout.implicitHeight

        radius: 5
        color: mouseArea.containsMouse ? Qt.alpha(Theme.colorOnSurface, 0.1) : Qt.alpha(Theme.colorOnSurface, 0)
        Behavior on color {
            ColorAnimation {
                duration: 100
            }
        }

        VectorIcon {
            id: layout
            anchors.centerIn: parent
            size: root.implicitHeight * 0.8
            iconScale: 0.7
            fillColor: Theme.colorOnSurface
            iconSrc: `../assets/cloud/cloud-${root.status}.svg`
        }
    }
    Tooltip {
        id: tooltip
        target: root
        text: `Cloud ${root.status}`
    }
}
