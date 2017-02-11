import QtQuick 2.5
import QtQuick.Layouts 1.1

Item {
    property var axes: ["X", "Y", "Z"]
    property var axisColors: ["green", "green", "green"]
    property string groupText: "G5x Offsets"
    property string centerText: "Position"
    property string rightText: "Distance to Go"
    property bool rightTextVisible: false
    property int margin: 15
    property color backgroundColor: "white"
    property color frameColor: "black"
    property color borderColor: "gray"
    property color textColor: "black"
    property int decimals: 3
    property int digits: 4

    property var model: []

    id: root
    width: 800
    implicitHeight: mainFrame.height + root.margin * 2

    Rectangle {
        id: mainFrame
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: root.margin
        implicitHeight: container.height + root.margin * 4
        radius: 10
        border.width: 2
        color: root.backgroundColor

        Column {
            id: container
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: root.margin * 2
            spacing:10

            Repeater {
                model: root.model
                DroElementBase {
                    id: item
                    anchors.left: parent.left
                    anchors.right: parent.right
                    borderColor: root.borderColor
                    backgroundColor: root.backgroundColor
                    textColor: root.textColor
                    axisName: root.model[index].name
                    axisColor: root.model[index ].color
                    rightTextVisible: root.rightTextVisible
                    decimals: root.decimals
                    digits: root.digits
                    value: root.model[index].value
                    rightValue: root.model[index].secondValue
                }
            }
        }
    }

    DroLabelText {
        id: groupLabel
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        color: root.backgroundColor
        textColor: root.textColor
        rotated: true
        text: root.groupText
    }

    DroLabelText {
        id: centerLabel
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: root.rightTextVisible ? parent.width * 0.27 : parent.width * 0.45
        color: root.backgroundColor
        textColor: root.textColor
        text: root.centerText
    }

    DroLabelText {
        id: rightLabel
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 0.15
        anchors.top: parent.top
        visible: root.rightTextVisible
        color: root.backgroundColor
        textColor: root.textColor
        text: root.rightText
    }
}
