import QtQuick 2.0
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0

AbstractDigitalReadOut {
    id: root
    implicitWidth: mainFrame.width
    implicitHeight: mainFrame.height + extraFrame.height + g5xOffsetsFrame.height + toolOffsetsFrame.height
    visible: _ready

    DroElementFrame {
        id: mainFrame
        width: root.offsetsVisible ? 900 : 450
        groupText: qsTr("DRO")
        centerText: qsTr("Position")
        rightText: qsTr("Distance to Go")
        rightTextVisible: root.offsetsVisible ? true : false
        decimals: root.decimals
        digits: root.digits

        model: {
            var list = [];
            for (var i = 0; i < root.axes; ++i) {
                var item = {};
                item.name = root.axisNames[i];
                item.value = Number(root.position[root._axisNames[i]]);
                var homed = (i < root.axisHomed.length) && root.axisHomed[root._axisIndices[i]].homed;
                item.color = homed ? "lightgreen" : "#FF4444";
                item.secondValue = Number(root.dtg[root._axisNames[i]]);
                list.push(item);
            }

            if (root.lathe) {
                item = list[0];
                item.name = qsTr("Rad");
                item.value = Number(root.position['x']);
                var homed = root.axisHomed[0].homed;
                item.color = homed ? "lightgreen" : "#FF4444";
                item.secondValue = Number(root.dtg['x']);
                item = Object.assign({}, item);
                item.name = qsTr("Dia");
                item.value = Number(root.position['x']) * 2.0;
                item.secondValue = Number(root.dtg['x']) * 2.0;
                list.splice(1, 0, item);
            }

            return list;
        }
    }

    DroElementFrame {
        id: extraFrame
        width: 450
        height: visible ? implicitHeight : 0
        anchors.top: mainFrame.bottom
        anchors.left: parent.left
        groupText: qsTr("Extra")
        centerText: ""
        visible: !root.offsetsVisible && (model.length > 0)

        model: {
            var list = [];
            var item

            if (root.velocityVisible) {
                item = {};
                item.name = qsTr("Vel");
                item.color = "lightyellow";
                item.value = root.velocity;
                item.secondValue = 0.0;
                list.push(item);
            }

            if (root.distanceToGoVisible) {
                item = {};
                item.name = qsTr("DTG");
                item.color = "lightyellow";
                item.value = root.distanceToGo;
                item.secondValue = 0.0;
                list.push(item);
            }

            if (root.spindleSpeedVisible) {
                item = {};
                item.name = qsTr("S%1").arg(root.spindleDirection === 1 ? "⟳" : (root.spindleDirection === -1 ? "⟲" : ""));
                item.color = "lightyellow";
                item.value = root.spindleSpeed;
                item.secondValue = 0.0;
                list.push(item);
            }

            return list;
        }
    }

    DroElementFrame {
        id: g5xOffsetsFrame
        width: 450
        height: visible ? implicitHeight : 0
        anchors.top: mainFrame.bottom
        groupText: qsTr("%1 Offsets").arg(root.g5xNames[root.g5xIndex - 1])
        centerText: qsTr("Position")
        visible: root.offsetsVisible
        decimals: root.decimals
        digits: root.digits

        model: {
            var list = [];
            for (var i = 0; i < root.axes; ++i) {
                var item = {};
                item.name = root.axisNames[i];
                item.value = Number(root.g5xOffset[root._axisNames[i]])
                item.color = "#FFDFCC";
                item.secondValue = 0.0;
                list.push(item);
            }
            return list;
        }
    }

    DroElementFrame {
        id: g92OffsetsFrame
        width: 450
        height: visible ? implicitHeight : 0
        anchors.top: mainFrame.bottom
        anchors.left: g5xOffsetsFrame.right
        groupText: qsTr("G92 Offsets")
        centerText: qsTr("Position")
        visible: root.offsetsVisible
        decimals: root.decimals
        digits: root.digits

        model: {
            var list = [];
            for (var i = 0; i < root.axes; ++i) {
                var item = {};
                item.name = root.axisNames[i];
                item.value = Number(root.g92Offset[root._axisNames[i]])
                item.color = "#B8F5FF";
                item.secondValue = 0.0;
                list.push(item);
            }
            return list;
        }
    }

    DroElementFrame {
        id: toolOffsetsFrame
        width: 450
        height: visible ? implicitHeight : 0
        anchors.top: g5xOffsetsFrame.bottom
        groupText: qsTr("Tool Offsets")
        centerText: qsTr("Position")
        visible: root.offsetsVisible
        decimals: root.decimals
        digits: root.digits

        model: {
            var list = [];
            for (var i = 0; i < root.axes; ++i) {
                var item = {};
                item.name = root.axisNames[i];
                item.value = Number(root.toolOffset[root._axisNames[i]])
                item.color = "#D7DDFF";
                item.secondValue = 0.0;
                list.push(item);
            }
            return list;
        }
    }
}
