import QtQuick 2.0
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0
import Machinekit.Service 1.0

ConnectionWindow {
    id: connectionWindow
    width: 1200
    height: 1000
    defaultTitle: "Cetus"
    autoSelectInstance: true
    autoSelectApplication: true
    remoteVisible: false
    localVisible: true
    mode: "local"
    lookupMode: ServiceDiscovery.MulticastDNS
    instanceFilter { name: "" }

    ApplicationDescription {
        sourceDir: "./Cetus/"
    }
}
