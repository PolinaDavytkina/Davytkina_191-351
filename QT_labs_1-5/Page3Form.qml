import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15

Page {
    ColumnLayout {
        anchors.fill: parent
        Layout.row: 0
        Layout.column: 0
        Layout.alignment: Qt.AlignCenter
        Button {
            id: fetchBtn
//            Layout.leftMargin: 10
            Layout.alignment: Qt.AlignCenter
            text: qsTr("Отправить запрос")
            onClicked: {
                doFetch()
            }
        }
        Label {
            Layout.row: 0
            Layout.column: 0
            Layout.alignment: Qt.AlignCenter
            id: mytext
//            Layout.fillWidth: true
            Layout.fillHeight: true
            font.pointSize: 40

        }
        Connections {
            target: root
            function onSignalText(value) {
                mytext.text=value
            }
        }

    }
}
