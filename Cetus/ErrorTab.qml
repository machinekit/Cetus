import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import Machinekit.Service 1.0
import Machinekit.HalRemote 1.0

Tab {
    title: qsTr("Error")
    active: true

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 5

        Service {
            id: halgroupService
            type: "halgroup"
        }

        HalGroup {
            id: errorSourcesHalGroup
            name: "error-sources"
            halgroupUri: halgroupService.uri
            ready: halgroupService.ready || connected
        }

        /*CheckBox {
            Layout.fillWidth: true
            text: qsTr("User Estop")
            checked: errorSourcesHalGroup.connected && errorSourcesHalGroup.values["estop-user"]
            enabled: false
        }

        CheckBox {
            Layout.fillWidth: true
            text: qsTr("GPIO I2C-chip ok")
            checked: errorSourcesHalGroup.connected && errorSourcesHalGroup.values["gpio-ok"]
            enabled: false
        }

        CheckBox {
            Layout.fillWidth: true
            text: qsTr("PWM I2C-chip ok")
            checked: errorSourcesHalGroup.connected && errorSourcesHalGroup.values["pwm-ok"]
            enabled: false
        }

        CheckBox {
            Layout.fillWidth: true
            text: qsTr("ADC I2C-chip ok")
            checked: errorSourcesHalGroup.connected && errorSourcesHalGroup.values["temp-ok"]
            enabled: false
        }

        CheckBox {
            Layout.fillWidth: true
            text: qsTr("E0 temperature in limit")
            checked: errorSourcesHalGroup.connected && errorSourcesHalGroup.values["e0_temp_in_limit"]
            enabled: false
        }

        CheckBox {
            Layout.fillWidth: true
            text: qsTr("E0 thermistor ok")
            checked: errorSourcesHalGroup.connected && errorSourcesHalGroup.values["therm_working"]
            enabled: false
        }

        CheckBox {
            Layout.fillWidth: true
            text: qsTr("Bed temperature in limit")
            checked: errorSourcesHalGroup.connected && errorSourcesHalGroup.values["in_limit"]
            enabled: false
        }

        CheckBox {
            Layout.fillWidth: true
            text: qsTr("Bed thermistor ok")
            checked: errorSourcesHalGroup.connected && errorSourcesHalGroup.values["therm_working"]
            enabled: false
        }*/

        Item {
            Layout.fillHeight: true
        }
    }
}
