import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0

Tab {
    title: qsTr("Manual") + " [" + manualAction.shortcut + "]"

    Item {

        /*JogStick {
            id: jogStick
            status: applicationStatus
            command: applicationCommand
        }*/

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 5

            RowLayout {
                Layout.fillWidth: true

                Label {
                        text: qsTr("Axis")
                }

                Item {
                    Layout.fillWidth: true
                }

                AxisRadioGroup {
                    id: axisRadioGroup
                    Layout.fillWidth: false
                }
            }

            RowLayout {
                Layout.fillWidth: true

                JogButton {
                    Layout.fillWidth: false
                    direction: -1
                    distance: jogCombo.distance
                    axis: axisRadioGroup.axis
                }

                JogButton {
                    Layout.fillWidth: false
                    direction: 1
                    distance: jogCombo.distance
                    axis: axisRadioGroup.axis
                }

                JogDistanceComboBox {
                    id: jogCombo
                    Layout.fillWidth: true
                    axis: axisRadioGroup.axis
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Button {
                    Layout.fillWidth: false
                    action: HomeAxisAction { axis: -1 }
                }

                Button {
                    Layout.fillWidth: false
                    action: HomeAxisAction { axis: axisRadioGroup.axis }
                }

                Button {
                    Layout.fillWidth: false
                    action: UnhomeAxisAction { axis: axisRadioGroup.axis }
                }

                Button {
                    Layout.fillWidth: false
                    action: TouchOffAction { touchOffDialog: touchOffDialog }
                }

                Item {
                    Layout.fillWidth: true
                }

                TouchOffDialog {
                    id: touchOffDialog
                    axis: axisRadioGroup.axis
                    height: window.height * 0.2
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: false

                Label {
                    text: qsTr("Jog Velocity")
                }
                Item {
                    Layout.fillWidth: true
                }

                Label {
                    text: jogVelocitySlider.displayValue.toFixed(1) + " " + jogVelocitySlider.units
                }
            }

            JogVelocitySlider {
                id: jogVelocitySlider
                Layout.fillWidth: true
                axis: axisRadioGroup.axis
                proportional: true
            }

            Label {
                text: qsTr("Machine")
            }

            RowLayout {
                Layout.fillWidth: true

                Button {
                    Layout.fillWidth: false
                    action: MistAction { }
                }

                Button {
                    Layout.fillWidth: false
                    action: FloodAction { }
                }

                Item {
                    Layout.fillWidth: true
                }
            }

            Label {
                text: qsTr("Spindle")
            }

            RowLayout {
                Layout.fillWidth: true

                Button {
                    action: SpindleCcwAction { }
                }
                Button {
                    action: StopSpindleAction { }
                }
                Button {
                    action: SpindleCwAction { }
                }

                Item {
                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Button {
                    action: DecreaseSpindleSpeedAction { }
                }
                Button {
                    action: IncreaseSpindleSpeedAction { }
                }

                Item {
                    Layout.fillWidth: true
                }
            }

            Item {
                Layout.fillHeight: true
            }
        }
    }
}
