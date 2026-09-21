import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import ".."

Text {
    text: Hyprland.activeToplevel?.title ?? ""
    color: Theme.colorOnSurface
    font.family: Theme.fontFamily
    font.pixelSize: Theme.fontSize
    font.bold: true

    Layout.maximumWidth: 350
    elide: Text.ElideMiddle
}
