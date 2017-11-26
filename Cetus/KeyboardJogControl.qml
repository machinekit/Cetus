import QtQuick 2.5
import QtQuick.Controls 1.2
import Machinekit.Application 1.0

ApplicationItem {
    property int axes: status.synced ? status.config.axes : 3
    property var decerementKeys: ["Left", "Down", "Page Down", "["]
    property var incrementKeys: ["Right", "Up", "Page Up", "]"]
    property var axisSelectionKeys: ["X", "Y", "Z", "A"]

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
        autoRepeat: false
    }

    Shortcut {
        readonly property int index: 1
        sequence: root.decerementKeys[index]
        onActivated: d.activateDecrement(index)
        enabled: root.axes >= (index + 1)
        autoRepeat: false
    }

    Shortcut {
        readonly property int index: 2
        sequence: root.decerementKeys[index]
        onActivated: d.activateDecrement(index)
        enabled: root.axes >= (index + 1)
        autoRepeat: false
    }

    Shortcut {
        readonly property int index: 3
        sequence: root.decerementKeys[index]
        onActivated: d.activateDecrement(index)
        enabled: root.axes >= (index + 1)
        autoRepeat: false
    }

    Shortcut {
        readonly property int index: 0
        sequence: root.incrementKeys[index]
        onActivated: d.activateIncrement(index)
        enabled: root.axes >= (index + 1)
        autoRepeat: false
    }

    Shortcut {
        readonly property int index: 1
        sequence: root.incrementKeys[index]
        onActivated: d.activateIncrement(index)
        enabled: root.axes >= (index + 1)
        autoRepeat: false
    }

    Shortcut {
        readonly property int index: 2
        sequence: root.incrementKeys[index]
        onActivated: d.activateIncrement(index)
        enabled: root.axes >= (index + 1)
        autoRepeat: false
    }

    Shortcut {
        readonly property int index: 3
        sequence: root.incrementKeys[index]
        onActivated: d.activateIncrement(index)
        enabled: root.axes >= (index + 1)
        autoRepeat: false
    }

    Shortcut {
        readonly property int index: 0
        sequence: root.axisSelectionKeys[index]
        onActivated: root.selectAxis(index)
        enabled: root.axes >= (index + 1)
        autoRepeat: false
    }

    Shortcut {
        readonly property int index: 1
        sequence: root.axisSelectionKeys[index]
        onActivated: root.selectAxis(index)
        enabled: root.axes >= (index + 1)
        autoRepeat: false
    }

    Shortcut {
        readonly property int index: 2
        sequence: root.axisSelectionKeys[index]
        onActivated: root.selectAxis(index)
        enabled: root.axes >= (index + 1)
        autoRepeat: false
    }

    Shortcut {
        readonly property int index: 3
        sequence: root.axisSelectionKeys[index]
        onActivated: root.selectAxis(index)
        enabled: root.axes >= (index + 1)
        autoRepeat: false
    }
}
