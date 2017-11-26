import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import Machinekit.Application.Controls 1.0
import Machinekit.PathView 1.0
import Machinekit.Controls 1.0
import "./Controls"

ToolBar {
    implicitHeight: rowLayout.implicitHeight

    RowLayout {
        id: rowLayout

        ToolButton { action: EstopAction { shortcut: "" } }
        ToolButton { action: PowerAction { shortcut: "" } }
        Spacer {}
        ToolButton { action: OpenAction { fileDialog: applicationFileDialog; shortcut: "" } }
        ToolButton { action: OpenAction { fileDialog: remoteFileDialog; remote: true; shortcut: "" } }
        ToolButton { action: ReopenAction { shortcut: "" } }
        Spacer {}
        ToolButton { action: RunProgramAction { shortcut: "" } }
        ToolButton { action: StepProgramAction { shortcut: "" } }
        ToolButton { action: PauseResumeProgramAction { shortcut: "" } }
        ToolButton { action: StopProgramAction { shortcut: "" } }
        Spacer {}
        ToolButton { action: ZoomOutAction { view: pathViewConfig } }
        ToolButton { action: ZoomInAction { view: pathViewConfig } }
        ToolButton { action: ZoomOriginalAction { view: pathViewConfig } }
        ToolButton { action: ViewModeAction { view: pathViewConfig; viewMode: "Top" } }
        ToolButton { action: ViewModeAction { view: pathViewConfig; viewMode: "RotatedTop" } }
        ToolButton { action: ViewModeAction { view: pathViewConfig; viewMode: "Front" } }
        ToolButton { action: ViewModeAction { view: pathViewConfig; viewMode: "Side" } }
        ToolButton { action: ViewModeAction { view: pathViewConfig; viewMode: "Perspective" } }
        Spacer {}
        ToolButton { action: ClearBackplotAction { shortcut: "" } }
    }
}
