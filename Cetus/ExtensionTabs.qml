import QtQuick 2.0
import QtQuick.Controls 1.2
import Machinekit.VideoView 1.0
import Machinekit.Service 1.0

Item {
    id: tabLoader
    Tab {
        id: webcamTab
        active: true
        title: qsTr("Webcam")

        MjpegStreamerClient {
            anchors.fill: parent
            videoUri: videoService.uri
            ready: videoService.ready && onOffSwitch.checked

            Label {
                anchors.centerIn: parent
                text: onOffSwitch.checked ? qsTr("No webcam connected.") : qsTr("Turn on the switch.")
                visible: !parent.ready
            }
            Service {
                id: videoService
                type: "video"
            }

            Switch {
                id: onOffSwitch
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: 5
            }
        }
    }
}
