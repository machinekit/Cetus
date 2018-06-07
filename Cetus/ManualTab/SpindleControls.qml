import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0

ColumnLayout {
    id: root
    visible: d.spindleCcwVisible || d.spindleCwVisible || d.spindleMinusVisible || d.spindlePlusVisible || d.spindleStopVisible

    ApplicationObject {
        id: d
        readonly property bool spindleCwVisible: status.synced && status.ui.spindleCwVisible
        readonly property bool spindleCcwVisible: status.synced && status.ui.spindleCcwVisible
        readonly property bool spindleStopVisible: status.synced && status.ui.spindleStopVisible
        readonly property bool spindlePlusVisible: status.synced && status.ui.spindlePlusVisible
        readonly property bool spindleMinusVisible: status.synced && status.ui.spindleMinusVisible
    }

    Label {
        text: qsTr("Spindle")
    }

    RowLayout {
        Layout.fillWidth: true

        Button {
            action: SpindleCcwAction { }
            visible: d.spindleCcwVisible
        }
        Button {
            action: StopSpindleAction { }
            visible: d.spindleStopVisible
        }
        Button {
            action: SpindleCwAction { }
            visible: d.spindleCwVisible
        }

        Item {
            Layout.fillWidth: true
        }
    }

    RowLayout {
        Layout.fillWidth: true

        Button {
            action: DecreaseSpindleSpeedAction { }
            visible: d.spindleMinusVisible
        }
        Button {
            action: IncreaseSpindleSpeedAction { }
            visible: d.spindlePlusVisible
        }

        Item {
            Layout.fillWidth: true
        }
    }
}
