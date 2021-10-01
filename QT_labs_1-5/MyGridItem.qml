import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15


Rectangle {
    Layout.fillWidth: true
    Layout.fillHeight: true
    Layout.margins: 5
    border.color: "black"
    radius: 3
    color: "transparent"
    property alias title: title
    default property alias items: dataContainer.children
    ColumnLayout {
        anchors.fill: parent
        Item {
            id: dataContainer
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 10
            clip: true
        }
        Label {
            id: title
            text: "Sample Text"
            Layout.margins: 0
            Layout.alignment: Qt.AlignBottom
            padding: 10
            topPadding: -10
            verticalAlignment: Text.AlignBottom
        }
    }
}
