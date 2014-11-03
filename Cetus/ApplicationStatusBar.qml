import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0

StatusBar {
        RowLayout {
            anchors.fill: parent
            Label {
                Layout.fillHeight: true
                Layout.preferredWidth: window.width * 0.15
                verticalAlignment: Text.AlignVCenter
                text: {
                    if (applicationCore.status.synced) {
                        switch (applicationCore.status.task.taskState) {
                            case ApplicationStatus.TaskStateEstop: return "ESTOP"
                            case ApplicationStatus.TaskStateEstopReset: return "OFF"
                            case ApplicationStatus.TaskStateOff: return "OFF"
                            case ApplicationStatus.TaskStateOn: return "ON"
                            default: return ""
                        }
                    }
                    else {
                        return qsTr("Not connected")
                    }
                }
            }

            Label {
                Layout.fillHeight: true
                Layout.preferredWidth: window.width * 0.15
                verticalAlignment: Text.AlignVCenter
                text: qsTr("No Tool")
            }

            Label {
                Layout.fillHeight: true
                Layout.preferredWidth: window.width * 0.15
                verticalAlignment: Text.AlignVCenter
                text: qsTr("Position: ") + textFunction()

                function textFunction() {
                    if (applicationCore.status.synced) {
                        switch (applicationCore.status.config.positionOffset) {
                            case ApplicationStatus.RelativePositionOffset: return qsTr("Relative Actual")
                            case ApplicationStatus.MachinePositionOffset: return qsTr("Machine Actual")
                            default: return ""
                        }
                    }
                    else {
                        return qsTr("")
                    }
                }
            }


            Item {
                Layout.fillWidth: true
            }
            ApplicationProgressBar{
                Layout.fillHeight: true
                width: parent.width * 0.3
                anchors.margins: 5
            }
        }
    }
