import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import Machinekit.Application 1.0

Label {
    Layout.fillHeight: true
    Layout.minimumWidth: parent.width * 0.2
    verticalAlignment: Text.AlignVCenter
    text: d.valid ? qsTr("Tool %1, offset: %2, diameter: %3")
                    .arg(d.toolId)
                    .arg((d.offset * d.distanceFactor).toFixed(d.mmActive ? 3 : 4))
                    .arg((d.diameter * d.distanceFactor).toFixed(d.mmActive ? 3 : 4))
                  : qsTr("No Tool")

    QtObject {
        id: d
        readonly property bool ready: appObject.status.synced && appObject.helper.ready
        readonly property double offset: ready ? Number(getToolOffsetById(toolId).z) : 0.0
        readonly property int toolId: ready ? appObject.status.io.toolInSpindle : 0
        readonly property double diameter: ready ? Number(getToolDiameterById(toolId)) : 0.0
        readonly property bool valid: toolId > 0
        readonly property bool mmActive: ready ? appObject.helper.distanceUnits === "mm" : true
        readonly property double distanceFactor: ready ? appObject.helper.distanceFactor : 1
        readonly property var toolTable: ready ? appObject.status.io.toolTable : []

        function getToolDiameterById(id) {
            return _getValueById("diameter", id, 0.0);
        }

        function getToolOffsetById(id) {
            return _getValueById("offset", id, {"z": 0.0});
        }

        function _getValueById(value, id, defaultValue) {
            id = Number(id);
            for (var i = 0; i < toolTable.length; ++i) {
                var item = toolTable[i]
                if (item.id === id)
                {
                    return item[value];
                }
            }
            return defaultValue;
        }
    }

    ApplicationObject {
        id: appObject
    }

    // Tool 1, offset: 0.000, diameter: 0.124
}
