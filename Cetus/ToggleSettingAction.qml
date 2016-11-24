import QtQuick 2.0
import QtQuick.Controls 1.2

Action {
    property string groupName: "group"
    property string valueName: "value"
    text: "Group Value"
    checkable: true
    checked: applicationCore.settings.initialized && applicationCore.settings.values[groupName][valueName]
    onTriggered: {
        applicationCore.settings.setValue(groupName + "." + valueName, !applicationCore.settings.values[groupName][valueName])
    }
}
