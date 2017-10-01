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
        readonly property string restValue: d.clampingFixed(value, decimals)
        readonly property int leftOver: (decimals + digits + 1) - restValue.length
        readonly property string leftOverText: d.getLeftOverText(leftOver)

        function getLeftOverText(len) {
            if (len > 0)
                return (Array(digits + 1).join('0')).slice(-len);
            return "";
        }

        function clampingFixed(value, decimals) {
            var factor = Math.pow(10, decimals);
            return ((~~(value * factor)) / factor).toFixed(decimals);
        }
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
