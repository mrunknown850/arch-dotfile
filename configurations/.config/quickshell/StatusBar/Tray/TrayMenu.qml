pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import "../.."

PopupWindow {
    id: root

    required property Tray target

    property var trayItems: SystemTray.items

    property int padding: 6
    property int itemSize: 27
    property int spacing: 6
    property int maxColumns: 5

    property int itemCount: trayItems.values.length
    property int columns: Math.min(itemCount, maxColumns)

    anchor {
        item: target
        edges: Edges.Bottom
        gravity: Edges.Bottom
        margins.bottom: -3
    }

    grabFocus: true
    onVisibleChanged: target.isOpened = visible

    color: "transparent"
    implicitWidth: padding * 2 + columns * itemSize + Math.max(0, columns - 1) * spacing
    implicitHeight: padding * 2 + Math.ceil(itemCount / maxColumns) * itemSize + Math.max(0, Math.ceil(itemCount / maxColumns) - 1) * spacing

    Rectangle {
        anchors.fill: parent
        border.color: Theme.surfaceVariant
        color: Theme.surface
        radius: 7
        Flow {
            id: grid

            anchors {
                top: parent.top
                left: parent.left
                margins: root.padding
            }

            width: parent.width - root.padding * 2
            spacing: root.spacing

            Repeater {
                model: root.trayItems

                delegate: TrayItem {
                    required property SystemTrayItem modelData
                    item: modelData
                    itemSize: root.itemSize
                }
            }
        }
    }
}
