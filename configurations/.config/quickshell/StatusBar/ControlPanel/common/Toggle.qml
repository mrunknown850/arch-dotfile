import QtQuick
import QtQuick.Layouts
import "../.."
import "../../.."

ColumnLayout {
    id: root
    required property string title
    required property string iconSrc

    property bool toggled: false

    property int size: 43

    spacing: 6
    Rectangle {
        color: root.toggled ? Theme.primaryContainer : Theme.surfaceVariant
        radius: 3
        implicitWidth: root.size * 2
        implicitHeight: root.size
        Behavior on color {
            ColorAnimation {
                duration: 100
            }
        }
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
    Text {
        id: text
        Layout.alignment: Qt.AlignHCenter
        text: root.title

        color: Theme.colorOnSurface
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize
    }
}
