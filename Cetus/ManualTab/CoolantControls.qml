import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0

ColumnLayout {
    id: root
    visible: d.mistVisible || d.floodVisible

    ApplicationObject {
        id: d
        readonly property bool mistVisible: status.synced && status.ui.coolantMistVisible
        readonly property bool floodVisible: status.synced && status.ui.coolantFloodVisible
    }

    Label {
        text: qsTr("Coolant")
    }

    RowLayout {
        Layout.fillWidth: true

        Button {
            Layout.fillWidth: false
            action: MistAction { }
            visible: d.mistVisible
        }

        Button {
            Layout.fillWidth: false
            action: FloodAction { }
            visible: d.floodVisible
        }

        Item {
            Layout.fillWidth: true
        }
    }
}
