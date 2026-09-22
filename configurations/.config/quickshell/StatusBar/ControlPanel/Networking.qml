import QtQuick
import QtQuick.Layouts
import Quickshell.Networking
import "../.."
import ".."

Item {
    id: root

    property int panelSize: parent.height

    implicitWidth: panelSize
    implicitHeight: panelSize
    Layout.alignment: Qt.AlignVCenter

    property string wifiName: ""

    function noInternet() {
        return Networking.connectivity === NetworkConnectivity.Limited || Networking.connectivity === NetworkConnectivity.Portal;
    }

    function getStatus() {
        // Prefer wired.
        for (const dev of Networking.devices.values) {
            if (dev.type === DeviceType.Wired && dev.connected) {
                return noInternet() ? "wired-no-internet" : "wired";
            }
        }

        // Then Wi-Fi.
        for (const dev of Networking.devices.values) {
            if (dev.type !== DeviceType.Wifi || !dev.connected)
                continue;

            for (const net of dev.networks.values) {
                if (!net.connected)
                    continue;

                root.wifiName = net.name;

                if (noInternet())
                    return "wifi-no-internet";

                const strength = net.signalStrength;

                if (strength <= 0.25)
                    return "wifi-1";
                if (strength <= 0.50)
                    return "wifi-2";
                if (strength <= 0.75)
                    return "wifi-3";

                return "wifi-4";
            }

            return "wifi-disconnected";
        }

        return "offline";
    }
    VectorIcon {
        anchors.centerIn: parent
        size: root.panelSize
        fillColor: Theme.colorOnSurface
        iconSrc: `../assets/controlpanel/network/network-${root.getStatus()}.svg`
    }
    Component.onCompleted: {
        if (Networking.canCheckConnectivity) {
            Networking.connectivityCheckEnabled = true;
            Networking.checkConnectivity();
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
            var status = root.getStatus();
            if (status === "offline")
                return "Offline";
            if (status === "wired-no-internet")
                return "No internet access";
            if (status === "wired")
                return "Ethernet Connected";
            if (status === "wifi-no-internet")
                return `${root.wifiName} - No internet access`;
            if (status === "wifi-1" || status === "wifi-2" || status === "wifi-3" || status === "wifi-4")
                return `${root.wifiName}`;
            if (status === "wifi-disconnected")
                return "Disconnected";
        }
    }
}
