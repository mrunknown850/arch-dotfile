pragma ComponentBehavior: Bound
import QtQuick
import ".."

// Reusable round icon button used across the status bar modules.
Rectangle {
    id: root

    property string iconSrc: ""
    property color fillColor: Theme.colorOnSurface
    property int size: 30
    property real iconScale: 0.8

    implicitWidth: size
    implicitHeight: size
    color: "transparent"

    Image {
        id: icon

        anchors.centerIn: parent

        source: root.iconSrc

        width: Math.round(root.size * root.iconScale)
        height: Math.round(root.size * root.iconScale)
        sourceSize.width: Math.round(width * Screen.devicePixelRatio)
        sourceSize.height: Math.round(height * Screen.devicePixelRatio)

        fillMode: Image.PreserveAspectFit
        layer.enabled: true
        layer.smooth: true
    }

    ShaderEffect {
        anchors.fill: icon
        property var source: icon
        property color tint: root.fillColor
        fragmentShader: "../assets/tint.frag.qsb"
    }
}
