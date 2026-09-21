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
    implicitHeight: visible ? layout.implicitHeight : 0

    RowLayout {
        id: layout
        anchors.fill: parent
        spacing: 8

        Item {
            id: iconContainer
            implicitWidth: root.height
            implicitHeight: root.height
            Layout.alignment: Qt.AlignVCenter

            VectorIcon {
                anchors.centerIn: parent
                size: root.height
                fillColor: root.contentColor
                iconSrc: root.player?.isPlaying ? "../assets/media/pause.svg" : "../assets/media/play.svg"
            }
        }
        Text {
            id: trackText

            property string artist: root.player?.trackArtist ?? ""
            property string title: root.player?.trackTitle ?? "No media playing"

            // Combine artist name with title
            text: artist !== "" ? `${artist} - ${title}` : title
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
