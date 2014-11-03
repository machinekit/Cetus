import QtQuick 2.0
import QtQuick.Controls 1.2

MenuBar {
    Menu {
        title: qsTr("&File")
    }
    Menu {
        title: qsTr("&Machine")
    }
    Menu {
        title: qsTr("&View")
        MenuItem { action: enablePreviewAction }
        MenuItem { action: showProgramAction }
        MenuItem { action: showProgramRapidsAction }
        MenuItem { action: showProgramExtentsAction }
        MenuItem { action: alphaBlendProgramAction }
        MenuItem { action: showLivePlotAction }
        MenuItem { action: showMachineLimitsAction }
        MenuItem { action: showToolAction }
        MenuItem { action: showCoordinateAction }
        MenuItem { action: showOffsetsAction }
        MenuItem { action: showVelocityAction }
        MenuItem { action: showDistanceToGoAction }

        ToggleSettingAction {
            id: showOffsetsAction
            groupName: "dro"
            valueName: "showOffsets"
            text: qsTr("Show o&ffsets")
        }

        ToggleSettingAction {
            id: showVelocityAction
            groupName: "dro"
            valueName: "showVelocity"
            text: qsTr("Show v&elocity")
        }

        ToggleSettingAction {
            id: showDistanceToGoAction
            groupName: "dro"
            valueName: "showDistanceToGo"
            text: qsTr("Show &distance to go")
        }

        ToggleSettingAction {
            id: enablePreviewAction
            groupName: "preview"
            valueName: "enable"
            text: qsTr("Enable &preview")
        }

        ToggleSettingAction {
            id: showMachineLimitsAction
            groupName: "preview"
            valueName: "showMachineLimits"
            text: qsTr("Sh&ow machine limits")
        }

        ToggleSettingAction {
            id: showProgramAction
            groupName: "preview"
            valueName: "showProgram"
            text: qsTr("S&how program")
        }

        ToggleSettingAction {
            id: showProgramExtentsAction
            groupName: "preview"
            valueName: "showProgramExtents"
            text: qsTr("Show program e&xtents")
        }

        ToggleSettingAction {
            id: showProgramRapidsAction
            groupName: "preview"
            valueName: "showProgramRapids"
            text: qsTr("Show program r&apids")
        }

        ToggleSettingAction {
            id: alphaBlendProgramAction
            groupName: "preview"
            valueName: "alphaBlendProgram"
            text: qsTr("Alpha-&blend program")
        }

        ToggleSettingAction {
            id: showLivePlotAction
            groupName: "preview"
            valueName: "showLivePlot"
            text: qsTr("Sho&w live plot")
        }

        ToggleSettingAction {
            id: showToolAction
            groupName: "preview"
            valueName: "showTool"
            text: qsTr("Sho&w tool")
        }

        ToggleSettingAction {
            id: showCoordinateAction
            groupName: "preview"
            valueName: "showCoordinate"
            text: qsTr("Show &coordinate")
        }
    }

    Menu {
        title: qsTr("&Help")
        MenuItem {
            text: qsTr("About &Cetus")
            onTriggered: aboutDialog.open()
        }
    }
}
