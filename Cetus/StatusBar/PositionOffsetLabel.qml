import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import Machinekit.Application 1.0

Label {
    Layout.fillHeight: true
    Layout.minimumWidth: parent.width * 0.15
    verticalAlignment: Text.AlignVCenter
    text: qsTr("Position: ") + textFunction()

    function textFunction() {
        if (applicationCore.status.synced) {
            switch (applicationCore.status.config.positionOffset) {
                case ApplicationStatus.RelativePositionOffset: return qsTr("Relative Actual");
                case ApplicationStatus.MachinePositionOffset: return qsTr("Machine Actual");
                default: return "";
            }
        }
        else {
            return "";
        }
    }
}
