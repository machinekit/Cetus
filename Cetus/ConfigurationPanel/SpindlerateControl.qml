import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0

ColumnLayout {
    id: root
    visible: d.spindleOverrideVisible

    ApplicationObject {
        id: d
        readonly property bool spindleOverrideVisible: status.synced && status.ui.spindleOverrideVisible
    }

    RowLayout {
        Layout.fillWidth: true
        Layout.fillHeight: false

        Label {
            text: qsTr("Spindle Override")
        }

        Item {
            Layout.fillWidth: true
        }

        Label {
            text: (spindlerateSlider.value * 100).toFixed(0) + "%"
        }
    }

    SpindlerateSlider {
        id: spindlerateSlider
        Layout.fillWidth: true
        Layout.fillHeight: false
    }
}
