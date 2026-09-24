import "../common"
import Quickshell.Services.Pipewire

ExtendableSlider {
    id: root
    readonly property PwNode dev: Pipewire.defaultAudioSink
    readonly property real volume: dev?.audio?.volume ?? 0.0
    readonly property bool isMuted: dev?.audio?.muted ?? false
    PwObjectTracker {
        objects: [root.dev]
    }

    function getVolumeTier(_p) {
        if (_p < 0.3)
            return "low";
        if (_p < 0.65)
            return "mid";
        return "high";
    }

    tooltip: `${Math.round(root.volume * 100)}%`
    iconSrc: {
        if (isMuted)
            return "../assets/actioncenter/audio/volume-muted.svg";
        return `../assets/actioncenter/audio/volume-${getVolumeTier(root.volume)}.svg`;
    }

    value: volume
    onValueChanged: dev.audio.volume = value
    triggerFunction: function () {
        dev.audio.muted = !root.isMuted;
    }
}
