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

ServiceWindow {
    id: window
    visible: true
    width: 1200
    height: 900
    title: qsTr("Cetus")

    statusBar:applicationStatusBar
    toolBar: applicationToolBar
    menuBar: applicationMenuBar

    ApplicationStatusBar { id: applicationStatusBar }
    ApplicationToolBar { id: applicationToolBar }
    ApplicationMenuBar { id: applicationMenuBar }

    ApplicationCore {
        id: applicationCore
        notifications: applicationNotifications
        applicationName: "Cetus"
    }

    PathViewCore {
        id: pathViewCore
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

        ManualTab {

        }

        MdiTab {

        }

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

    /*ConfigurationPanel {
        id: groupBox
        anchors.left: leftTabView.left
        anchors.right: leftTabView.right
        anchors.bottom: sourceView.top
        height: parent.height * 0.28
    }*/

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
            Item {
                DigitalReadOut {
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.margins: Screen.pixelDensity*2
                }
            }
        }
        Tab {
            id: previewTab
            title: qsTr("Preview")

            PathView3D {
                id: pathView
                anchors.fill: parent

                Binding {
                    target: pathView; property: "zoom"; value: pathView3D.zoom
                }
                Binding {
                    target: pathView3D; property: "zoom"; value: pathView.zoom
                }
                Binding {
                    target: pathView; property: "viewMode"; value: pathView3D.viewMode
                }
                Binding {
                    target: pathView3D; property: "viewMode"; value: pathView.viewMode
                }

                Rectangle {
                    id: droRect
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.margins: Screen.pixelDensity * 2
                    width: dro.width
                    height: dro.height
                    color: Qt.rgba(0, 0, 0, 0.7)
                    radius: Screen.pixelDensity * 3
                    border.width: 1
                    border.color: "black"
                    DigitalReadOut {
                        id: dro
                        textColor: "white"
                    }
                }
            }
        }

        QtObject {
            id: pathView3D
            property double zoom: 0.95
            property string viewMode: "Perspective"
        }

        ExtensionTabs { id: extensionTabs }

        onActiveChanged:  {
            if (!loaded) {
                var tabs = extensionTabs.children
                for (var i = 0; i < tabs.length; ++i)
                {
                    centerTabView.addTab(tabs[i].title, tabs[i].sourceComponent)
                }
                loaded = true
            }
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

    AboutDialog {
        id: aboutDialog
    }
}
