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
}
