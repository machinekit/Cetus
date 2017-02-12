import QtQuick 2.0
import QtQuick.Controls 1.2
import Machinekit.VideoView 1.0
import Machinekit.Service 1.0

Item {
    id: root
    MjpegStreamerClient {
        id: streamerClient
        anchors.fill: parent
        videoUri: videoService.uri
        ready: videoService.ready && onOffSwitch.checked
    }

    Service {
        id: videoService
        type: "video"
    }

    Rectangle {
        anchors.fill: parent
        color: "white"
        visible: !streamerClient.ready

        Label {
            anchors.centerIn: parent
            text: onOffSwitch.checked ? qsTr("No webcam connected.") : qsTr("Turn on the switch.")
        }
    }

    Switch {
        id: onOffSwitch
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 5
    }
}
