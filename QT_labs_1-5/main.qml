import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: root
    width: 1000
    height: 600
    visible: true

    signal doFetch()
    signal signalText(string value)
    signal friends(string data)

    signal auth(string data)

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
            header: RowLayout {
                Image {
                    source: "img/inst.svg"
                    Layout.preferredWidth:  100
                    Layout.preferredHeight: 50
                    mipmap: true
                    fillMode: Image.PreserveAspectFit
                }
                Label{
                    text: qsTr("lab1")
                    font.pointSize: 20
                }
                Image {
                    source: "img/dir.svg"
                    Layout.preferredWidth:  35
                    Layout.preferredHeight: 35
                    fillMode: Image.PreserveAspectFit
                    mipmap: true
                    horizontalAlignment: Image.AlignRight

                }
            }

        }

        Page2Form {
            header: RowLayout {
                Image {
                    source: "img/inst.svg"
                    Layout.preferredWidth:  100
                    Layout.preferredHeight: 50
                    mipmap: true
                    fillMode: Image.PreserveAspectFit
                }
                Label{

                    text: qsTr("lab2")
                    font.pointSize: 20
                }
                Image {
                    source: "img/dir.svg"
                    Layout.preferredWidth:  35
                    Layout.preferredHeight: 35
                    fillMode: Image.PreserveAspectFit
                    mipmap: true
                    horizontalAlignment: Image.AlignRight

                }
            }

        }

        Page3Form {
            header: RowLayout {
                Image {
                    source: "img/inst.svg"
                    Layout.preferredWidth:  100
                    Layout.preferredHeight: 50
                    mipmap: true
                    fillMode: Image.PreserveAspectFit
                }
                Label{
                    text: qsTr("lab3")
                    font.pointSize: 20
                }
                Image {
                    source: "img/dir.svg"
                    Layout.preferredWidth:  35
                    Layout.preferredHeight: 35
                    fillMode: Image.PreserveAspectFit
                    mipmap: true
                    horizontalAlignment: Image.AlignRight

                }
            }
        }
        Page4Form {
            header: RowLayout {
                Image {
                    source: "img/inst.svg"
                    Layout.preferredWidth:  100
                    Layout.preferredHeight: 50
                    mipmap: true
                    fillMode: Image.PreserveAspectFit
                }
                Label{
                    text: qsTr("lab4-5")
                    font.pointSize: 20
                }
                Image {
                    source: "img/dir.svg"
                    Layout.preferredWidth:  35
                    Layout.preferredHeight: 35
                    fillMode: Image.PreserveAspectFit
                    mipmap: true
                    horizontalAlignment: Image.AlignRight

                }
            }
        }

//        Page6Form {
//            header: RowLayout {
//                Image {
//                    source: "img/inst.svg"
//                    Layout.preferredWidth:  100
//                    Layout.preferredHeight: 50
//                    mipmap: true
//                    fillMode: Image.PreserveAspectFit
//                }
//                Label{
//                    text: qsTr("lab6")
//                    font.pointSize: 20
//                }
//                Image {
//                    source: "img/dir.svg"
//                    Layout.preferredWidth:  35
//                    Layout.preferredHeight: 35
//                    fillMode: Image.PreserveAspectFit
//                    mipmap: true
//                    horizontalAlignment: Image.AlignRight

//                }
//            }
//        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Page 1")
        }
        TabButton {
            text: qsTr("Page 2")
        }
        TabButton {
            text: qsTr("Page 3")
        }
        TabButton {
            text: qsTr("Page 4-5")
        }
//        TabButton {
//            text: qsTr("Page 6")
//        }
    }
}
