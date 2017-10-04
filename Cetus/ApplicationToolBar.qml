import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import Machinekit.Application.Controls 1.0
import Machinekit.PathView 1.0
import Machinekit.Controls 1.0
import "Controls"

ToolBar {
    implicitHeight: rowLayout.implicitHeight

    RowLayout {
        id: rowLayout

        ToolButton { action: EstopAction { } }
        ToolButton { action: PowerAction { } }
        Spacer {}
        ToolButton { action: OpenAction { fileDialog: applicationFileDialog } }
        ToolButton { action: ReopenAction { } }
        Spacer {}
        ToolButton { action: RunProgramAction { } }
        ToolButton { action: StepProgramAction { } }
        ToolButton { action: PauseResumeProgramAction { } }
        ToolButton { action: StopProgramAction { } }
        Spacer {}
        ToolButton { action: ZoomOutAction { view: pathViewConfig } }
        ToolButton { action: ZoomInAction { view: pathViewConfig } }
        ToolButton { action: ZoomOriginalAction { view: pathViewConfig } }
        ToolButton { action: ViewModeAction { view: pathViewConfig; viewMode: "Top" } }
        ToolButton { action: ViewModeAction { view: pathViewConfig; viewMode: "RotatedTop" } }
        ToolButton { action: ViewModeAction { view: pathViewConfig; viewMode: "Front" } }
        ToolButton { action: ViewModeAction { view: pathViewConfig; viewMode: "Side" } }
        ToolButton { action: ViewModeAction { view: pathViewConfig; viewMode: "Perspective" } }
    }
}
