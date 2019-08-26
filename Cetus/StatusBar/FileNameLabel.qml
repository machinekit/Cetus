import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import Machinekit.Application 1.0

Label {
    id: root
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
    elide: Text.ElideRight

    readonly property string __fileName: object.file.remoteFilePath ? object.file.remoteFilePath.split('/').reverse()[0] : ""

    text: __fileName

    ApplicationObject {
        id: object
    }
}
