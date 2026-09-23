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
        VectorIcon {
            anchors.centerIn: parent
            iconSrc: root.iconSrc
            fillColor: Theme.colorOnPrimaryContainer
            size: root.size * 0.6
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
