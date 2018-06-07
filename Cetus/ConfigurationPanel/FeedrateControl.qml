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
           text: qsTr("Feed Override")
        }

        Item {
           Layout.fillWidth: true
        }

        Label {
           text: (feedrateSlider.value * 100).toFixed(0) + "%"
        }
    }

    FeedrateSlider {
        id: feedrateSlider
        Layout.fillWidth: true
        Layout.fillHeight: false
    }
}
