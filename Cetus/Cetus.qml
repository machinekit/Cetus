import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0
import Machinekit.HalRemote 1.0
import Machinekit.Application 1.0
import Machinekit.Service 1.0
import Machinekit.Application.Controls 1.0
import Machinekit.PathView 1.0
import Machinekit.VideoView 1.0
import "./StatusBar"

ServiceWindow {
    id: window
    visible: true
    width: 1200
    height: 900
    title: applicationCore.applicationName + (d.machineName === "" ? "" :" - " +  d.machineName)

    statusBar:applicationStatusBar
    toolBar: applicationToolBarMobile.active ? applicationToolBarMobile : applicationToolBar
    menuBar: applicationMenuBar

    Item {
        id: d
        property string machineName: applicationCore.status.config.name
    }

    ApplicationStatusBar { id: applicationStatusBar }
    ApplicationMenuBar { id: applicationMenuBar }
    Loader {
        id: applicationToolBar
        source: "ApplicationToolBar.qml"
        active: !applicationToolBarMobile.active
    }
    Loader {
        id: applicationToolBarMobile
        source: "ApplicationToolBarMobile.qml"
        active: (Qt.platform.os == "android")
    }

    ApplicationCore {
        id: applicationCore
        notifications: applicationNotifications
        applicationName: "Cetus"
    }

    PathViewCore {
        id: pathViewCore
    }

    Item {
        id: pathViewConfig
        property double cameraZoom: 0.95
        property string viewMode: "Perspective"
    }

    SourceView {
        id: sourceView
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: parent.height * 0.25
    }

    TabView {
        id: leftTabView
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: sourceView.top
        width: parent.width * 0.3

        ManualTab { }

        MdiTab { }

        Action {
            id: mdiAction
            shortcut: "F5"
            onTriggered: leftTabView.currentIndex = 1
        }
        Action {
            id: manualAction
            shortcut: "F3"
            onTriggered: leftTabView.currentIndex = 0
        }

    }

    TabView {
        id: centerTabView
        anchors.left: leftTabView.right
        anchors.right: rightTabView.left
        anchors.top: parent.top
        anchors.bottom: sourceView.top

        property bool active: droTab.status === Loader.Ready
        property bool loaded: false

        Tab {
            id: droTab
            title: qsTr("DRO")
            DroPanel {}
        }
        Tab {
            id: previewTab
            title: qsTr("Preview")
            PreviewPanel { }
        }

        Tab {
            id: webcamTab
            active: true
            title: qsTr("Webcam")
            WebcamPanel { }
        }
    }

    DisplayPanel {
        id: rightTabView
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: sourceView.top
        width: parent.width * 0.25
    }

    ApplicationNotifications {
        id: applicationNotifications
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.margins: Screen.pixelDensity
        messageWidth: parent.width * 0.15
    }

    ApplicationFileDialog {
        id: applicationFileDialog
    }

    ApplicationRemoteFileDialog {
        id: remoteFileDialog
        width: window.width
        height: window.height
    }

    AboutDialog {
        id: aboutDialog
    }
}
