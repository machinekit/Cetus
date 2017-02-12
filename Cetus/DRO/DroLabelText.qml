import QtQuick 2.0

Rectangle {
    property string text: "Foo"
    property bool rotated: false
    property int margin: 5
    property color textColor: "white"

    id: root
    implicitWidth: (root.rotated ? label.height : label.width) + margin * 2
    implicitHeight: (root.rotated ? label.width : label.height) + margin * 2
    visible: text.length > 0

    Text {
        id: label
        anchors.centerIn: parent
        rotation: root.rotated ? -90 : 0
        text: root.text
        color: root.textColor
    }
}
