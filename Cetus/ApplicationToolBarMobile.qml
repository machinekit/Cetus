import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import Machinekit.Application.Controls 1.0
import Machinekit.PathView 1.0
import Machinekit.Controls 1.0

ToolBar {
    implicitHeight: Screen.pixelDensity * 7.5
    RowLayout {
        anchors.fill: parent
        TouchButton {
            Layout.fillHeight: true
            action: EstopAction { }
        }
        TouchButton {
            Layout.fillHeight: true
            action: PowerAction { }
        }
        TouchButton {
            Layout.fillHeight: true
            action: OpenAction { fileDialog: applicationFileDialog }
        }
        TouchButton {
            Layout.fillHeight: true
            action: ReopenAction { }
        }
        TouchButton {
            Layout.fillHeight: true
            action: RunProgramAction { }
        }
        TouchButton {
            Layout.fillHeight: true
            action: StepProgramAction { }
        }
        TouchButton {
            Layout.fillHeight: true
            action: PauseResumeProgramAction { }
        }
        TouchButton {
            Layout.fillHeight: true
            action: StopProgramAction { }
        }
        TouchButton {
            Layout.fillHeight: true
            action: ZoomOutAction { view: pathView3D }
        }
        TouchButton {
            Layout.fillHeight: true
            action: ZoomInAction { view: pathView3D }
        }
        TouchButton {
            Layout.fillHeight: true
            action: ZoomOriginalAction { view: pathView3D }
        }
        TouchButton {
            Layout.fillHeight: true
            action: ViewModeAction { view: pathView3D; viewMode: "Top" }
        }
        TouchButton {
            Layout.fillHeight: true
            action: ViewModeAction { view: pathView3D; viewMode: "RotatedTop" }
        }
        TouchButton {
            Layout.fillHeight: true
            action: ViewModeAction { view: pathView3D; viewMode: "Front" }
        }
        TouchButton {
            Layout.fillHeight: true
            action: ViewModeAction { view: pathView3D; viewMode: "Side" }
        }
        TouchButton {
            Layout.fillHeight: true
            action: ViewModeAction { view: pathView3D; viewMode: "Perspective" }
        }
        TouchButton {
            Layout.fillHeight: true
            action: ClearBackplotAction {}
        }
        Item {
            Layout.fillWidth: true
        }
    }

    ApplicationFileDialog {
        id: applicationFileDialog
    }
}
