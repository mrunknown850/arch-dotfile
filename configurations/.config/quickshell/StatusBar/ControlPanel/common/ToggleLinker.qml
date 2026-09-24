import QtQuick
import QtQuick.Layouts
import "../.."
import "../../.."

ColumnLayout {
    id: root
    required property string title
    required property string iconSrc
    property var triggerFunction
    property int size: 43

    property bool toggled: false
    spacing: 6
    Rectangle {
        color: "transparent"
        radius: 3
        implicitWidth: root.size * 2
        implicitHeight: root.size
        RowLayout {
            anchors.fill: parent
            spacing: 0
            Rectangle {
                id: leftSection

                color: root.toggled ? Theme.primaryContainer : Theme.surfaceVariant
                Layout.fillWidth: true
                Layout.fillHeight: true
                topLeftRadius: 3
                bottomLeftRadius: 3

                VectorIcon {
                    anchors.centerIn: parent
                    iconSrc: root.iconSrc
                    fillColor: root.toggled ? Theme.colorOnPrimary : Theme.colorOnSurfaceVariant
                    size: root.size * 0.6
                }
                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        root.toggled = !root.toggled;
                    }
                }
            }
            Rectangle {
                id: rightSection
                Layout.fillWidth: true
                Layout.fillHeight: true
                topRightRadius: 3
                bottomRightRadius: 3
                color: root.toggled ? Theme.primaryContainer : Theme.surfaceVariant

                VectorIcon {
                    id: rightIcon
                    anchors.centerIn: parent
                    iconSrc: "../assets/tray/chevron.svg"
                    rotation: 180 + 90
                    fillColor: root.toggled ? Theme.colorOnPrimary : Theme.colorOnSurfaceVariant
                    size: root.size * 0.6
                }
                SequentialAnimation {
                    id: blipAnimation
                    ParallelAnimation {
                        ColorAnimation {
                            target: rightIcon
                            property: "fillColor"
                            to: root.toggled ? Theme.colorOnSurfaceVariant : Theme.colorOnPrimary
                            duration: 80
                        }
                        ColorAnimation {
                            target: rightSection
                            property: "color"
                            to: root.toggled ? Theme.surfaceVariant : Theme.primaryContainer
                            duration: 80
                        }
                    }
                    ParallelAnimation {
                        ColorAnimation {
                            target: rightIcon
                            property: "fillColor"
                            to: root.toggled ? Theme.colorOnPrimary : Theme.colorOnSurfaceVariant
                            duration: 200
                        }
                        ColorAnimation {
                            target: rightSection
                            property: "color"
                            to: root.toggled ? Theme.primaryContainer : Theme.surfaceVariant
                            duration: 80
                        }
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        blipAnimation.restart();
                        root.triggerFunction();
                    }
                }
            }
        }
        Rectangle {
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                bottom: parent.bottom
                topMargin: 1
                bottomMargin: 1
            }
            width: 1
            opacity: 0.2
            color: root.toggled ? Theme.inversePrimary : Theme.colorOnPrimary
            z: 1
        }
    }
    Text {
        id: text
        Layout.alignment: Qt.AlignHCenter
        text: root.title

        color: Theme.colorOnSurface
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize
    }
}
