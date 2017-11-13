import QtQuick 2.0

Item {
    property int decimals: 3
    property int digits: 4
    property double value: 12.2349
    property color activeColor: "white"
    property color inactiveColor: "#BBBBBB"
    property alias font: digitsText.font

    id: root
    implicitWidth: container.width
    implicitHeight: container.height

    QtObject {
        id: d
        readonly property double absolute: Math.abs(value)
        readonly property string restValue: absolute.toFixed(root.decimals)
        readonly property int leftOver: root.digits - decimalsText.text.length + root.decimals + 1
        readonly property string leftOverText: (leftOver <= 0) ? "" : "000000000".slice(-leftOver)
        readonly property bool sign: Number(value.toFixed(decimals)) < 0
    }

    Text {
        id: signText
        anchors.right: container.left
        visible: d.sign
        color: root.activeColor
        font: digitsText.font
        text: "-"
    }

    Row {
        id: container
        anchors.centerIn: parent

        Text {
            id: digitsText
            color: root.inactiveColor
            text: d.leftOverText
            font.family: "Monospace"
        }

        Text {
            id: decimalsText
            font: digitsText.font
            color: root.activeColor
            text: d.restValue
        }
    }
}
