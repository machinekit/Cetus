import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0

ColumnLayout {
    id: root

    RowLayout {
        Layout.fillWidth: true
        Layout.fillHeight: false

        Label {
            text: qsTr("Maximum Velocity")
        }

        Item {
            Layout.fillWidth: true
        }

        Label {
            text: maximumVelocitySlider.displayValue.toFixed(1) + maximumVelocitySlider.units
        }
    }

    MaximumVelocitySlider {
        id: maximumVelocitySlider
        Layout.fillWidth: true
        Layout.fillHeight: false
        proportional: true
    }
}
