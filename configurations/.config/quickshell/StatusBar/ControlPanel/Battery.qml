import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower
import "../.."
import ".."

Item {
    id: root

    property int panelSize: parent.height
    readonly property UPowerDevice dev: UPower.displayDevice

    implicitWidth: panelSize
    implicitHeight: panelSize
    Layout.alignment: Qt.AlignVCenter

    // Time formater
    function formatDuration(totalSeconds) {
        if (!totalSeconds || totalSeconds <= 0)
            return "0m";

        let hours = Math.floor(totalSeconds / 3600);
        let minutes = Math.floor((totalSeconds % 3600) / 60);

        if (hours > 0) {
            return `${hours}h ${minutes}m`;
        }
        return `${minutes}m`;
    }

    function getBatteryTier(_p) {
        if (_p < 0.1)
            return "critical";
        if (_p < 0.3)
            return "low";
        if (_p < 0.7)
            return "medium";
        return "full";
    }

    VectorIcon {
        anchors.centerIn: parent
        size: root.panelSize
        fillColor: Theme.colorOnSurface
        iconSrc: {
            if (root.dev.state === UPowerDeviceState.Charging)
                return `../assets/controlpanel/battery/battery-${root.getBatteryTier(root.dev.percentage)}-charging.svg`;
            return `../assets/controlpanel/battery/battery-${root.getBatteryTier(root.dev.percentage)}.svg`;
        }
    }

    HoverHandler {
        onHoveredChanged: {
            if (hovered)
                tooltip.startHover();
            else
                tooltip.stopHover();
        }
    }

    Tooltip {
        id: tooltip
        target: root

        text: {
            if (root.dev.state === UPowerDeviceState.Charging)
                return `Full in ${root.formatDuration(root.dev.timeToFull)} - ${Math.round(root.dev.percentage * 100)}%`;
            return `Empty in ${root.formatDuration(root.dev.timeToEmpty)} - ${Math.round(root.dev.percentage * 100)}%`;
        }
    }
}
