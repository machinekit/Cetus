import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import Machinekit.Application.Controls 1.0
import Machinekit.PathView 1.0
import Machinekit.Controls 1.0

ToolBar {
    implicitHeight: rowLayout.implicitHeight

    RowLayout {
        id: rowLayout

        ToolButton { action: EstopAction { } }
        ToolButton { action: PowerAction { } }
        ToolButton { action: OpenAction { fileDialog: applicationFileDialog } }
        ToolButton { action: ReopenAction { } }
        ToolButton { action: RunProgramAction { } }
        ToolButton { action: StepProgramAction { } }
        ToolButton { action: PauseResumeProgramAction { } }
        ToolButton { action: StopProgramAction { } }
        ToolButton { action: ZoomOutAction { view: pathView3D } }
        ToolButton { action: ZoomInAction { view: pathView3D } }
        ToolButton { action: ZoomOriginalAction { view: pathView3D } }
        ToolButton { action: ViewModeAction { view: pathView3D; viewMode: "Top" } }
        ToolButton { action: ViewModeAction { view: pathView3D; viewMode: "RotatedTop" } }
        ToolButton { action: ViewModeAction { view: pathView3D; viewMode: "Front" } }
        ToolButton { action: ViewModeAction { view: pathView3D; viewMode: "Side" } }
        ToolButton { action: ViewModeAction { view: pathView3D; viewMode: "Perspective" } }
    }
}
