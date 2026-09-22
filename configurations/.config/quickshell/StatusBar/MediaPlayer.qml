import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Mpris
import ".."

Item {
    id: root

    readonly property MprisPlayer player: Mpris.players.values[0] ?? null

    readonly property color contentColor: player?.isPlaying ? Theme.colorOnSurface : Theme.surfaceVariant

    visible: player !== null
    implicitWidth: visible ? layout.implicitWidth : 0
    implicitHeight: visible ? parent.parent.height : 0

    function getSymbol() {
        return player?.isPlaying ? "⏸" : "▶";
    }

    RowLayout {
        id: layout
        anchors.fill: parent
        spacing: 8

        Text {
            id: trackText

            property string artist: `${root.player?.trackArtist} - ` ?? ""
            property string title: root.player?.trackTitle ?? "No media playing"

            text: `${root.getSymbol()} ${artist} ${title}`
            color: root.contentColor
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSize

            Layout.maximumWidth: 300
            elide: Text.ElideRight
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.player?.togglePlaying()
    }
}
