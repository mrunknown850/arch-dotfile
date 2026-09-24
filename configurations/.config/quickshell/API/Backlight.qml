pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    // Normalized 0..1 value
    property real value: 0

    // Raw brightnessctl maximum
    property int max: 0

    Process {
        id: valueProcess

        command: ["brightnessctl", "get"]

        stdout: StdioCollector {
            onStreamFinished: {
                const raw = parseInt(text.trim());

                if (root.max > 0)
                    root.value = raw / root.max;
            }
        }
    }

    Process {
        id: maxProcess

        command: ["brightnessctl", "max"]

        stdout: StdioCollector {
            onStreamFinished: {
                root.max = parseInt(text.trim());

                // Re-read value after max is known
                valueProcess.running = true;
            }
        }
    }

    Process {
        id: setProcess

        command: []
    }

    onValueChanged: {
        setProcess.command = ["brightnessctl", "set", String(Math.round(value * max))];

        setProcess.running = true;
    }

    Component.onCompleted: {
        maxProcess.running = true;
    }
}
