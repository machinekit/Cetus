import QtQuick 2.0
import QtQuick.Controls 1.1
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0
import Machinekit.Service 1.0

ApplicationWindow {
    id: applicationWindow

    visibility: (Qt.platform.os == "android") ? "FullScreen" : "AutomaticVisibility"
    visible: true
    width: 1200
    height: 1000
    title: connectionWindow.title
    toolBar: connectionWindow.toolBar
    statusBar: connectionWindow.statusBar
    menuBar: connectionWindow.menuBar

    ConnectionWindow {
        id: connectionWindow

        anchors.fill: parent
        defaultTitle: "Cetus"
        autoSelectInstance: false
        autoSelectApplication: true
        remoteVisible: false
        localVisible: true
        mode: "local"
        lookupMode: ServiceDiscovery.MulticastDNS
        applications: [
            ApplicationDescription {
                sourceDir: "qrc:/Cetus/"
            }
        ]
        instanceFilter: ServiceDiscoveryFilter{ name: "" }
    }
}


