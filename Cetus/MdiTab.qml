import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0

Tab {
    title: qsTr("MDI") + " [" + mdiAction.shortcut + "]"
    active: true

    Item {
        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 5

            MdiHistoryTable {
                id: mdiHistoryTable
                onCommandSelected: {
                    mdiCommandEdit.text = command
                }

                onCommandTriggered: {
                    mdiCommandEdit.text = command
                    mdiCommandEdit.action.trigger()
                }
            }

            MdiCommandEdit {
                id: mdiCommandEdit
            }

            Label {
                text: qsTr("Active GCodes")
            }

            GCodeLabel {
                Layout.fillWidth: true
                wrapMode: Text.Wrap
            }
        }


    }
}
