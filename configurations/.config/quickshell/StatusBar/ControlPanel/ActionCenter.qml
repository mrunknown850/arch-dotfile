pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell
import "./common"
import "./apps"
import "../.."
import ".."

PopupWindow {
    id: root
    required property ControlPanel target

    anchor {
        item: target
        edges: Edges.Bottom
        gravity: Edges.Bottom
        margins.bottom: -3
    }
    color: "transparent"

    property int padding: 13
    property int spacing: 12

    implicitWidth: grid.implicitWidth + padding * 2
    implicitHeight: grid.implicitHeight + padding * 2

    Rectangle {
        anchors.fill: parent
        border.color: Theme.surfaceVariant
        color: Theme.surface
        radius: 7

        GridLayout {
            id: grid
            anchors.fill: parent
            anchors.margins: root.padding
            columns: 3
            rowSpacing: root.spacing * 1.3
            columnSpacing: root.spacing

            AppWifi {}
            AppBluetooth {}
            AppVPN {}
            AppAwake {}
            AppProjection {}
            AppAudio {
                Layout.columnSpan: 3
                Layout.fillWidth: true
            }
            AppBacklight {
                Layout.columnSpan: 3
                Layout.fillWidth: true
            }
        }
    }
}
