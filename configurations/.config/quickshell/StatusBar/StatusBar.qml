import QtQuick
import Quickshell
import QtQuick.Layouts
import "./Workspace"
import ".."

PanelWindow {
    id: bar

    property var scale: 0.032

    anchors {
        left: true
        right: true
        top: true
    }

    // Container appearance
    implicitHeight: screen.height * scale
    color: Theme.surface
    Rectangle {
        height: 2
        color: Theme.surfaceVariant
        opacity: 0.5
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }

    // Left Aligned
    RowLayout {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: parent.height * 0.2
        spacing: parent.height * 0.35

        WorkspaceContainer {}
        MediaPlayer {}
    }

    // Center Aligned
    RowLayout {
        anchors.centerIn: parent
        WindowTitle {}
    }

    // Right Aligned
    RowLayout {
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: parent.height * 0.4
        spacing: parent.height * 0.5

        ControlPanel {}
        Clock {}
    }
}
