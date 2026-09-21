// Workspace Containers
import Quickshell.Hyprland
import QtQuick

Repeater {
    model: Hyprland.workspaces
    delegate: Workspace {
        required property var modelData
        workspace: modelData
        visible: modelData.id > 0
    }
}
