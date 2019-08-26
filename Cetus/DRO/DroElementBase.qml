import QtQuick 2.5
import QtQuick.Layouts 1.1

Item {
    property string axisName: "X"
    property color axisColor: "#FFAA00"
    property color backgroundColor: "black"
    property color borderColor: "white"
    property color textColor: "white"
    property int decimals: 3
    property int digits: 4
    property bool rightTextVisible: true
    property double value: 0.0
    property double rightValue: 0.0

    id: root
    width: 1000
    height: 80

    Rectangle {
        id: mainFrame
        anchors.fill: parent
        anchors.margins: 5
        radius: 10
        border.width: 2
        border.color: root.borderColor
        color: root.backgroundColor
    }

    Rectangle {
        id: axisIndicator
        radius: 10
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        height: mainFrame.height * 1.05
        width: height
        border.width: 2
        color: root.axisColor

        Text {
            id: axisTitleText
            anchors.centerIn: parent
            font.pixelSize: text.length == 1 ? 50 : 33
            text: root.axisName
        }
    }

    RowLayout {
        anchors.left: axisIndicator.right
        anchors.right: mainFrame.right
        anchors.verticalCenter: parent.verticalCenter

        MultiText {
            id: centerText
            Layout.fillWidth: true
            activeColor: root.textColor
            font.pixelSize: 45
            digits: root.digits
            decimals: root.decimals
            value: root.value
        }

        MultiText {
            id: rightText
            Layout.fillWidth: true
            visible: root.rightTextVisible
            activeColor: root.textColor
            font.pixelSize: 45
            digits: root.digits
            decimals: root.decimals
            value: root.rightValue
        }
    }
}
