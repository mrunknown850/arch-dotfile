pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property string script: Quickshell.env("HOME") + "/.local/bin/rclone-sync.sh"
    property string status: "idle"  // "idle" | "syncing" | "error"

    property int exitCode: 0

    property real lastStart: 0
    property real lastEnd: 0

    readonly property bool syncing: status === "syncing"
    readonly property bool failed: status === "error"

    function sync(): void {
        if (syncing)
            return;

        syncProcess.running = true;
    }

    function unlock(): void {
        if (syncing)
            return;

        unlockProcess.running = true;
    }

    Process {
        id: watchProcess

        command: [root.script, "watch"]
        running: true

        stdout: SplitParser {
            onRead: data => {
                if (data.trim() === "")
                    return;

                const json = JSON.parse(data);

                root.status = json.state;
                root.exitCode = json.exit_code ?? 0;
                root.lastStart = json.last_start ?? 0;
                root.lastEnd = json.last_end ?? 0;
            }
        }
    }

    Process {
        id: syncProcess

        command: [root.script, "run"]
    }

    Process {
        id: unlockProcess

        command: [root.script, "unlock"]
    }
}
