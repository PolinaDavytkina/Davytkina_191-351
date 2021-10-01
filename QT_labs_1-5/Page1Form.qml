import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15

Page {
    id: page1

    GridLayout {
        anchors.fill: parent
        columns: 3
        rows: 3
        MyGridItem {
            title.text: qsTr("Slider")
            Slider {
                anchors.fill: parent
            }
        }
        MyGridItem {
            title.text: qsTr("BusyIndicator")
//            GridLayout {
//                anchors.fill: parent
//                columns: 2
//                BusyIndicator{}
//                BusyIndicator{}
//                BusyIndicator{}
//                BusyIndicator{}
//            }
            BusyIndicator{ anchors.fill: parent}
        }
        MyGridItem {
            title.text: qsTr("Text")
            Text{
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                text: "Giraffes are very beautiful and unusual animals. They are the tallest land animals in the world. Giraffes can reach a height of 5,5 m and a weight of 900 kg. They are famous for their long necks. But does anybody know, that giraffes have a very long tongue? They even can clean the ears with it! "

            }
        }
        MyGridItem {
            title.text: qsTr("TextArea")
            TextArea{
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
//                placeholderText: qsTr("TextArea")
            }
        }
        MyGridItem {
            title.text: qsTr("Dial")
            Dial{
                anchors.fill: parent
            }
        }
        MyGridItem {
            title.text: qsTr("Switch")
            GridLayout {
                anchors.fill: parent
                columns: 2
                Switch { checked: true }
                Switch { checked: true }
                Switch { checked: false }
                Switch { checked: false }
            }

        }
    }
}
