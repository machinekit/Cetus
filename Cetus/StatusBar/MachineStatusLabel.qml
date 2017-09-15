import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import Machinekit.Application 1.0

Label {
    Layout.fillHeight: true
    Layout.minimumWidth: parent.width * 0.15
    verticalAlignment: Text.AlignVCenter
    text: {
        if (applicationCore.status.synced) {
            switch (applicationCore.status.task.taskState) {
                case ApplicationStatus.TaskStateEstop: return qsTr("ESTOP");
                case ApplicationStatus.TaskStateEstopReset: return qsTr("OFF");
                case ApplicationStatus.TaskStateOff: return qsTr("OFF");
                case ApplicationStatus.TaskStateOn: return qsTr("ON");
                default: return "";
            }
        }
        else {
            return qsTr("Not connected")
        }
    }
}
