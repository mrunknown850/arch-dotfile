import QtQuick
import QtQuick.Layouts
import "./ControlPanel/"
import ".."

Item {
    width: root.implicitWidth
    height: parent.parent.height
    HoverHandler {
        id: hoverHandler
    }

    Rectangle {
        id: root

        property int panelSize: Math.round(Theme.fontSize * 1.8)

        anchors.centerIn: parent
        implicitWidth: layout.implicitWidth * 1.1
        implicitHeight: layout.implicitHeight * 1.2

        radius: 5
        color: hoverHandler.hovered ? Qt.alpha(Theme.colorOnSurface, 0.1) : Qt.alpha(Theme.colorOnSurface, 0)
        Behavior on color {
            ColorAnimation {
                duration: 100
            }
        }

        RowLayout {
            id: layout

            anchors.centerIn: parent
            spacing: 3
            Networking {
                panelSize: root.panelSize
            }
            Audio {
                panelSize: root.panelSize
            }

            Battery {
                panelSize: root.panelSize
            }
        }
    }
}
