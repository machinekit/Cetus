import QtQuick 2.0

Item {
    id: root

    StyledDroBase {
        id: base
        anchors.centerIn: parent
        scale: Math.min(root.width / implicitWidth, root.height / implicitHeight)
    }
}
