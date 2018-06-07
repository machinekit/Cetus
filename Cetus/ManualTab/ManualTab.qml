import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0

Tab {
    title: qsTr("Manual") + " [" + manualShortcut.sequence + "]"

    Item {

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 5

            AxisControls {}

            CoolantControls {}

            SpindleControls {}

            Item {
                Layout.fillHeight: true
            }
        }
    }
}
