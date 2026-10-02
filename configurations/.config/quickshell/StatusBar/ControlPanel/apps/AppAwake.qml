import "../common"
import Quickshell.Wayland

Toggle {
    id: root

    required property var window

    title: "Awake"
    iconSrc: "../assets/actioncenter/awake.svg"

    IdleInhibitor {
        window: root.window
        enabled: root.toggled
    }
}
