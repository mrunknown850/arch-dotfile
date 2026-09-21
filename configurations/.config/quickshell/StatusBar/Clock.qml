import QtQuick
import Quickshell
import ".."

Text {
    // 1. Use Qt.formatDateTime for JS Date objects
    text: Qt.formatDateTime(clock.date, "hh:mm AP")

    color: Theme.colorOnSurface
    font.family: Theme.fontFamily
    font.pixelSize: Theme.fontSize
    font.weight: 600

    SystemClock {
        id: clock
        // 2. Qualify the enum with SystemClock
        precision: SystemClock.Seconds
    }
}
