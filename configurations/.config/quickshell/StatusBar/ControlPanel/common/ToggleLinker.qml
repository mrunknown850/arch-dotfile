import QtQuick
import QtQuick.Layouts
import "../.."
import "../../.."

ColumnLayout {
    id: root
    required property string title
    required property string iconSrc
    property int size: 43

    spacing: 6
    Rectangle {
        color: Theme.primaryContainer
        radius: 3
        implicitWidth: root.size * 2
        implicitHeight: root.size
        RowLayout {
            anchors.fill: parent
            spacing: 0
            VectorIcon {
                Layout.fillWidth: true
                Layout.fillHeight: true
                iconSrc: root.iconSrc
                fillColor: Theme.colorOnPrimaryContainer
                size: root.size * 0.6
            }
            Rectangle {
                Layout.preferredWidth: 1
                Layout.fillHeight: true
                Layout.topMargin: 6
                Layout.bottomMargin: 6
                color: Theme.colorOnPrimaryContainer
                opacity: 0.2
            }
            VectorIcon {
                Layout.fillWidth: true
                Layout.fillHeight: true
                iconSrc: "../assets/tray/chevron.svg"
                rotation: 90 + 180
                fillColor: Theme.colorOnPrimaryContainer
                size: root.size * 0.6
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
