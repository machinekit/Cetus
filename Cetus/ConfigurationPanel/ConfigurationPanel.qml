import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0

ColumnLayout {
    anchors.margins: 5

    FeedrateControl {}

    RapidrateControl {}

    SpindlerateControl {}

    MaximumVelocityControl {}

    GantryConfigControl {}

    Item {
        Layout.fillHeight: true
        Layout.fillWidth: true
    }
}
