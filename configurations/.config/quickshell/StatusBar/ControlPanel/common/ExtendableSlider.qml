import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "../.."
import "../../.."

Rectangle {
    id: root

    implicitHeight: 26
    radius: 7
    color: "transparent"

    required property string iconSrc
    property string tooltip: ""
    property var triggerFunction: null
    property var triggerMoreFunction: null
    property bool hasMore: triggerMoreFunction != null
    property real value: 0.5

    RowLayout {
        anchors.fill: parent
        spacing: 4

        // Left icon
        Rectangle {
            Layout.preferredWidth: root.implicitHeight
            Layout.preferredHeight: root.implicitHeight

            color: leftBtn.containsMouse ? Theme.surfaceVariant : "transparent"
            radius: 3
            Behavior on color {
                ColorAnimation {
                    duration: 100
                }
            }
            VectorIcon {
                anchors.centerIn: parent

                iconSrc: root.iconSrc
                fillColor: Theme.colorOnSurface
                size: root.implicitHeight * 0.8
            }
            MouseArea {
                id: leftBtn
                anchors.fill: parent
                hoverEnabled: true
                enabled: root.triggerFunction != null
                onClicked: {
                    root.triggerFunction();
                }
            }
        }

        Item {
            id: slider
            Layout.fillWidth: true
            Layout.fillHeight: true

            Rectangle {
                anchors {
                    left: parent.left
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                }
                radius: 3
                color: Theme.surfaceVariant
                Rectangle {
                    width: parent.width * root.value
                    height: parent.height
                    topLeftRadius: parent.radius
                    bottomLeftRadius: parent.radius
                    color: Theme.primaryContainer
                }
            }
            Tooltip {
                target: root
                visible: root.tooltip != "" && sliderRegion.containsMouse
                text: root.tooltip
            }
            MouseArea {
                id: sliderRegion
                anchors.fill: parent
                hoverEnabled: true
                onWheel: {
                    root.value = Math.max(0, Math.min(1, root.value + (wheel.angleDelta.y / 1200)));
                    wheel.accepted = true;
                }
                onPressed: {
                    updateValue(mouseX);
                }
                onPositionChanged: {
                    if (pressed)
                        updateValue(mouseX);
                }
                function updateValue(x) {
                    root.value = Math.max(0, Math.min(1, x / width));
                }
            }
        }
        // Right option button
        Rectangle {
            Layout.preferredWidth: root.implicitHeight
            Layout.preferredHeight: root.implicitHeight

            color: rightBtn.containsMouse ? Theme.surfaceVariant : "transparent"
            radius: 3
            Behavior on color {
                ColorAnimation {
                    duration: 100
                }
            }
            VectorIcon {
                visible: root.hasMore
                anchors.fill: parent
                iconSrc: "../assets/tray/chevron.svg"
                rotation: 180 + 90
                fillColor: Theme.colorOnSurface
                size: root.implicitHeight * 0.8
            }
            MouseArea {
                id: rightBtn
                anchors.fill: parent
                hoverEnabled: true
                enabled: root.hasMore
                onClicked: {
                    root.triggerMoreFunction();
                }
            }
        }
    }
}
