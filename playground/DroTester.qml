import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import "../Cetus/DRO"

Rectangle {
    id: root
    color: "black"
    width: 1300
    height: 1000

    Rectangle {
        id: dummyBox
        anchors.fill: parent
        anchors.margins: 40
        color: "white"

        StyledDro {
            id: dro
            anchors.left: parent.left
            anchors.top: parent.top
            width:widthSlider.value * parent.width
            height: heightSlider.value * parent.height
        }
    }

    Slider {
        id: widthSlider
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        from: 0.0
        to: 1.0
        value: 0.7
    }

    Slider {
        id: heightSlider
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        orientation: Qt.Vertical
        from: 0.0
        to: 1.0
        value: 0.7
    }
}
