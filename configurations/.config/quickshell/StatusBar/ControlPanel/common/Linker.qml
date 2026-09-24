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

    spacing: 6
    Rectangle {
        id: hitbox
        color: Theme.surfaceVariant
        radius: 3
        implicitWidth: root.size * 2
        implicitHeight: root.size
        FlexboxLayout {
            anchors.centerIn: parent
            alignItems: FlexboxLayout.AlignCenter
            VectorIcon {
                id: icon1
                iconSrc: root.iconSrc
                fillColor: Theme.colorOnSurfaceVariant
                size: root.size * 0.6
            }
            VectorIcon {
                id: icon2
                iconSrc: "../assets/tray/chevron.svg"
                rotation: 90 + 180
                fillColor: Theme.colorOnSurfaceVariant
                size: root.size * 0.6
            }
        }
        SequentialAnimation {
            id: blipAnimation
            ParallelAnimation {
                ColorAnimation {
                    target: icon1
                    property: "fillColor"
                    to: Theme.colorOnPrimary
                    duration: 80
                }
                ColorAnimation {
                    target: icon2
                    property: "fillColor"
                    to: Theme.colorOnPrimary
                    duration: 80
                }
                ColorAnimation {
                    target: hitbox
                    property: "color"
                    to: Theme.primaryContainer
                    duration: 80
                }
            }
            ParallelAnimation {
                ColorAnimation {
                    target: icon1
                    property: "fillColor"
                    to: Theme.colorOnSurfaceVariant
                    duration: 200
                }
                ColorAnimation {
                    target: icon2
                    property: "fillColor"
                    to: Theme.colorOnSurfaceVariant
                    duration: 200
                }
                ColorAnimation {
                    target: hitbox
                    property: "color"
                    to: Theme.surfaceVariant
                    duration: 80
                }
            }
        }
        MouseArea {
            id: leftMouseArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onClicked: {
                blipAnimation.restart();
                root.triggerFunction();
            }
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
