import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import Machinekit.Application.Controls 1.0

ColumnLayout {
    anchors.margins: 5

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

    RowLayout {
        Layout.fillWidth: true
        Layout.fillHeight: false

        Label {
            text: qsTr("Rapid Override")
        }

        Item {
            Layout.fillWidth: true
        }

        Label {
            text: (rapidrateSlider.value * 100).toFixed(0) + "%"
        }
    }

    RapidrateSlider {
        id: rapidrateSlider
        Layout.fillWidth: true
        Layout.fillHeight: false
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

    Item {
        Layout.fillHeight: true
        Layout.fillWidth: true
    }
}
