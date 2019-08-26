import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import Machinekit.Application.Controls 1.0
import "../Controls"

StatusBar {
    id : root

    RowLayout {
        anchors.fill: parent

        MachineStatusLabel {
            Layout.fillHeight: true
            Layout.minimumWidth: parent.width * 0.15
        }

        Spacer {}

        ToolStatusLabel {
            Layout.fillHeight: true
            Layout.minimumWidth: parent.width * 0.2
        }

        Spacer {}

        PositionOffsetLabel {
            Layout.fillHeight: true
            Layout.minimumWidth: parent.width * 0.15
        }

        Spacer {}

        Item { Layout.fillWidth: true }

        Spacer {}

        FileNameLabel {
            Layout.fillHeight: true
            Layout.minimumWidth: parent.width * 0.15
        }
    }
}
