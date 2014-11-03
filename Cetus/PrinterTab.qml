import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import Machinekit.Service 1.0
import Machinekit.HalRemote 1.0
import Machinekit.HalRemote.Controls 1.0
import Machinekit.Controls 1.0
import Machinekit.Application.Controls 1.0

Tab {
    id: printerTab
    title: qsTr("Printer")
    active: true

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 5

        Service {
            id: halrcompService
            type: "halrcomp"
        }
        Service {
            id: halrcmdService
            type: "halrcmd"
        }

        HalRemoteComponent {
            halrcmdUri: halrcmdService.uri
            halrcompUri: halrcompService.uri
            ready: (halrcmdService.ready && halrcompService.ready) || (state === HalRemoteComponent.Connected)
            name: "printerui"
            containerItem: printerTab
        }

        HalLabel {
            id: tempSetLabel
            name: "e0.temp.set"
            prefix: qsTr("E0 temperature - set to ")
            decimals: 1
            suffix: "°C"
            halPin.type: HalPin.Float
        }

        HalGauge {
            id: e0TempGauge
            Layout.fillWidth: true
            name: "e0.temp.meas"
            suffix: "°C"
            decimals: 1
            minimumValueVisible: false
            maximumValueVisible: false
            minimumValue: 0
            maximumValue: 280
            z0BorderValue: 50
            z1BorderValue: 230
            z0Color: "green"
            z1Color: "yellow"
            z2Color: "red"
            MouseArea {
                anchors.fill: parent
                onClicked: e0TempChart.visible = !e0TempChart.visible
                cursorShape: "PointingHandCursor"
            }
        }

        LogChart {
            id: e0TempChart
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.25
            visible: false
            value: e0TempGauge.value
            minimumValue: e0TempGauge.minimumValue
            maximumValue: e0TempGauge.maximumValue
            leftTextVisible: false
            rightTextVisible: false
            autoSampling: (e0TempGauge.halPin.synced) && visible
            updateInterval: 500
            timeSpan: 120000
        }

        RowLayout {
            Layout.fillWidth: true
            SpinBox {
                Layout.fillWidth: true
                id: e0TempSetSpin
                minimumValue: 0.0
                maximumValue: 250.0
                decimals: 1

                Keys.onReturnPressed: {
                    e0TempAction.mdiCommand = "M204 P" + e0TempSetSpin.value.toFixed(1)
                    e0TempAction.trigger()
                }
            }

            Button {
                Layout.preferredWidth: printerTab.width * 0.3
                id: e0OnButton
                text: qsTr("On")
                checkable: true
                enabled: e0TempAction.enabled
                onClicked: {
                    if (e0TempSetSpin.value <= 0)
                    {
                        checked = false
                        return
                    }

                    e0TempAction.mdiCommand = "M204 P" + e0TempSetSpin.value.toFixed(1)
                    e0TempAction.trigger()
                }

                Binding {
                    target: e0OnButton
                    property: "checked"
                    value: tempSetLabel.halPin.value > 0.0
                }
            }
            Button {
                Layout.preferredWidth: printerTab.width * 0.3
                id: e0OffButton
                text: qsTr("Off")
                checkable: true
                enabled: e0TempAction.enabled
                onClicked: {
                    e0TempAction.mdiCommand = "M204 P0"
                    e0TempAction.trigger()
                }

                Binding {
                    target: e0OffButton
                    property: "checked"
                    value: tempSetLabel.halPin.value <= 0.0
                }
            }

            MdiCommandAction {
                id: e0TempAction
                enableHistory: false
            }
        }

        HalLabel {
            id: bedTempSetLabel
            name: "bed.temp.set"
            prefix: qsTr("Bed temperature - set to ")
            decimals: 1
            suffix: "°C"
            halPin.type: HalPin.Float
        }

        HalGauge {
            id: bedTempGauge
            Layout.fillWidth: true
            name: "bed.temp.meas"
            suffix: "°C"
            decimals: 1
            minimumValueVisible: false
            maximumValueVisible: false
            minimumValue: 0
            maximumValue: 160
            z0BorderValue: 50
            z1BorderValue: 120
            z0Color: "green"
            z1Color: "yellow"
            z2Color: "red"
            MouseArea {
                anchors.fill: parent
                onClicked: bedTempChart.visible = !bedTempChart.visible
                cursorShape: "PointingHandCursor"
            }
        }

        LogChart {
            id: bedTempChart
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.25
            visible: false
            value: bedTempGauge.value
            minimumValue: bedTempGauge.minimumValue
            maximumValue: bedTempGauge.maximumValue
            leftTextVisible: false
            rightTextVisible: false
            autoSampling: (bedTempGauge.halPin.synced) && visible
            updateInterval: 500
            timeSpan: 120000
        }

        RowLayout {
            Layout.fillWidth: true
            SpinBox {
                Layout.fillWidth: true
                id: bedTempSetSpin
                minimumValue: 0.0
                maximumValue: 150.0
                decimals: 1

                Keys.onReturnPressed: {
                    bedTempAction.mdiCommand = "M240 P" + bedTempSetSpin.value.toFixed(1)
                    bedTempAction.trigger()
                }
            }

            Button {
                Layout.preferredWidth: printerTab.width * 0.3
                id: bedOnButton
                text: qsTr("On")
                checkable: true
                enabled: bedTempAction.enabled
                onClicked: {
                    if (bedTempSetSpin.value <= 0)
                    {
                        checked = false
                        return
                    }

                    bedTempAction.mdiCommand = "M240 P" + bedTempSetSpin.value.toFixed(1)
                    bedTempAction.trigger()
                }

                Binding {
                    target: bedOnButton
                    property: "checked"
                    value: bedTempSetLabel.halPin.value > 0.0
                }
            }
            Button {
                Layout.preferredWidth: printerTab.width * 0.3
                id: bedOffButton
                text: qsTr("Off")
                checkable: true
                enabled: bedTempAction.enabled
                onClicked: {
                    bedTempAction.mdiCommand = "M240 P0"
                    bedTempAction.trigger()
                }

                Binding {
                    target: bedOffButton
                    property: "checked"
                    value:  bedTempSetLabel.halPin.value <= 0.0
                }
            }

            MdiCommandAction {
                id: bedTempAction
                enableHistory: false
            }
        }

        Label {
            text: qsTr("Fan speed")
        }

        HalGauge {
            Layout.fillWidth: true
            name: "e0.fan.pwm"
            suffix: "%"
            valueLabel.text: (value * 100).toFixed(decimals) + suffix
            decimals: 0
            minimumValueVisible: false
            maximumValueVisible: false
            minimumValue: 0
            maximumValue: 1
            z0BorderValue: 1
            z1BorderValue: 1
            z0Color: "white"
            z1Color: "lightblue"
            z2Color: "lightblue"
        }

        Item {
            Layout.fillHeight: true
        }

        Button {
            Layout.fillWidth: true
            text: qsTr("Remove Filament")
            enabled: filamentAction.enabled
            onClicked: {
                filamentAction.mdiCommand = "G92 A0"
                filamentAction.trigger()
                filamentAction.mdiCommand = "G1 A-60 F200"
                filamentAction.trigger()
            }
        }
        Button {
            Layout.fillWidth: true
            text: qsTr("Insert Filament")
            enabled: filamentAction.enabled
            onClicked: {
                filamentAction.mdiCommand = "G92 A0"
                filamentAction.trigger()
                filamentAction.mdiCommand = "G1 A110 F200"
                filamentAction.trigger()
            }
        }
        Button {
            Layout.fillWidth: true
            text: qsTr("Calibrate")
            enabled: filamentAction.enabled
            onClicked: {
                filamentAction.mdiCommand = "M270"
                filamentAction.trigger()
            }
        }

        Button {
            Layout.fillWidth: true
            text: qsTr("Probe")
            enabled: filamentAction.enabled
            onClicked: {
                filamentAction.mdiCommand = "M271"
                filamentAction.trigger()
            }
        }

        MdiCommandAction {
            id: filamentAction
            enableHistory: false
        }
    }
}
