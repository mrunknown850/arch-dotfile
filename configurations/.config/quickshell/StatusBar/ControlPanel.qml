import QtQuick
import QtQuick.Layouts
import "./ControlPanel/"
import ".."

Rectangle {
    id: root

    property int panelSize: Math.round(Theme.fontSize * 1.8)
    color: "transparent"

    implicitWidth: visible ? layout.implicitWidth : 0
    implicitHeight: visible ? layout.implicitHeight : 0

    RowLayout {
        id: layout
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

    MouseArea {
        anchors.fill: parent
    }
}
