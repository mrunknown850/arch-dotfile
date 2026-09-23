import QtQuick
import Quickshell
import Quickshell.Services.SystemTray
import "../.."
import ".."

Rectangle {
    id: root
    required property SystemTrayItem item
    property int itemSize: 28

    width: itemSize
    height: itemSize

    radius: 3
    color: hoverHandler.hovered ? Theme.surfaceVariant : "transparent"
    Behavior on color {
        ColorAnimation {
            duration: 100
        }
    }

    Image {
        anchors.centerIn: parent
        width: root.itemSize * 0.6
        height: width
        source: root.item.icon
    }

    HoverHandler {
        id: hoverHandler
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
        text: root.item.tooltipTitle
    }

    QsMenuAnchor {
        id: menuAnchor

        menu: root.item.menu
        anchor {
            item: root
            edges: Edges.Bottom
            gravity: Edges.Bottom
        }
    }

    TapHandler {
        cursorShape: Qt.PointingHandCursor
        acceptedButtons: Qt.LeftButton
        onTapped: {
            tooltip.stopHover();

            if (root.item.onlyMenu)
                menuAnchor.open();
            else
                root.item.activate();
        }
    }

    TapHandler {
        cursorShape: Qt.PointingHandCursor
        acceptedButtons: Qt.RightButton

        onTapped: {
            tooltip.stopHover();

            if (root.item.hasMenu)
                menuAnchor.open();
        }
    }
}
