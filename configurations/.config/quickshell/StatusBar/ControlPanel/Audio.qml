import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire
import "../.."
import ".."

Item {
    id: root

    property int panelSize: parent.height
    readonly property PwNode dev: Pipewire.defaultAudioSink

    PwObjectTracker {
        objects: [root.dev]
    }

    readonly property real volume: dev?.audio?.volume ?? 0.0
    readonly property bool isMuted: dev?.audio?.muted ?? false

    implicitWidth: panelSize
    implicitHeight: panelSize
    Layout.alignment: Qt.AlignVCenter

    function getVolumeTier(_p) {
        if (_p < 0.3)
            return "low";
        if (_p < 0.65)
            return "mid";
        return "high";
    }

    VectorIcon {
        anchors.centerIn: parent
        size: root.panelSize
        fillColor: Theme.colorOnSurface
        iconSrc: {
            const audio = root.dev?.audio;
            if (!audio)
                return "../assets/controlpanel/audio/volume-unavailable.svg";
            if (root.isMuted)
                return "../assets/controlpanel/audio/volume-muted.svg";
            return `../assets/controlpanel/audio/volume-${root.getVolumeTier(root.volume)}.svg`;
        }
    }
}
