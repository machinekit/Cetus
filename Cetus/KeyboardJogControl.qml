import QtQuick 2.5
import QtQuick.Controls 1.2

Item {
    property int axes: 3
    property var decerementKeys: ["Left", "Down", "Page Down"]
    property var incrementKeys: ["Right", "Up", "Page Up"]

    id: root

    signal selectAxis(int axis)
    signal increment(bool enabled)
    signal decrement(bool enabled)
    signal selectIncrement(int index)

    QtObject {
        id: d
        function activateIncrement(axis) {
            root.selectAxis(axis);
            root.selectIncrement(1);
            root.increment(true);
            root.increment(false);
        }

        function activateDecrement(axis) {
            root.selectAxis(axis);
            root.selectIncrement(1);
            root.decrement(true);
            root.decrement(false);
        }
    }

    Shortcut {
        readonly property int index: 0
        sequence: root.decerementKeys[index]
        onActivated: d.activateDecrement(index)
        enabled: root.axes >= (index + 1)
    }

    Shortcut {
        readonly property int index: 1
        sequence: root.decerementKeys[index]
        onActivated: d.activateDecrement(index)
        enabled: root.axes >= (index + 1)
    }

    Shortcut {
        readonly property int index: 2
        sequence: root.decerementKeys[index]
        onActivated: d.activateDecrement(index)
        enabled: root.axes >= (index + 1)
    }

    Shortcut {
        readonly property int index: 0
        sequence: root.incrementKeys[index]
        onActivated: d.activateIncrement(index)
        enabled: root.axes >= (index + 1)
    }

    Shortcut {
        readonly property int index: 1
        sequence: root.incrementKeys[index]
        onActivated: d.activateIncrement(index)
        enabled: root.axes >= (index + 1)
    }

    Shortcut {
        readonly property int index: 2
        sequence: root.incrementKeys[index]
        onActivated: d.activateIncrement(index)
        enabled: root.axes >= (index + 1)
    }
}
