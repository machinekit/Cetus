import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import Machinekit.Application.Controls 1.0
import "../Controls"

StatusBar {
    id : root

    RowLayout {
        anchors.fill: parent

        MachineStatusLabel {}
        Spacer {}
        ToolStatusLabel {}
        Spacer {}
        PositionOffsetLabel {}
        Spacer {}
        Item { Layout.fillWidth: true }

        Spacer {}
        ApplicationProgressBar {
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.3
            anchors.margins: 5
        }
    }
}
