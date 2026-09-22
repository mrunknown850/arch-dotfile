// Workspace Containers
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

RowLayout {
    id: layout
    spacing: 5
    Repeater {
        model: Hyprland.workspaces
        delegate: Workspace {
            required property var modelData
            workspace: modelData
            visible: modelData.id > 0
        }
    }
}
