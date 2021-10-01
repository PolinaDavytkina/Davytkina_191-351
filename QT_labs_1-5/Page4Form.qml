
import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtMultimedia 5.15
import Qt.labs.qmlmodels 1.0
import QtWebView 1.15

Page {
    ColumnLayout {
        anchors.fill: parent
        Button {
            id: fetchBtn
            Layout.leftMargin: 10
//            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
            Layout.alignment: Qt.AlignCenter
            text: qsTr("Войти через mail.ru")
            onClicked: {
                webView.url = "https://connect.mail.ru/oauth/authorize?client_id=784111&response_type=token&redirect_uri=https%3A%2F%2Fconnect.mail.ru%2Foauth%2Fsuccess.html"
                webView.visible = true
                fetchBtn.visible = false
                cancelBtn.visible = true
                tokenLabel.visible = false
            }
        }
        Button {
            id: cancelBtn
            Layout.leftMargin: 10
//            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
            Layout.alignment: Qt.AlignCenter
            text: qsTr("Назад")
            onClicked: {
                webView.visible = false
                fetchBtn.visible = true
                cancelBtn.visible = false
                tokenLabel.visible = true
            }
            visible: false
        }

        WebView {
            id: webView
            Layout.fillWidth: true
            Layout.fillHeight: true
            visible: false
            onLoadingChanged: {
                console.log("onLoadingChanged", loadRequest.url)
                if ((loadRequest.url + "").indexOf("https://connect.mail.ru/oauth/success.html") == 0) {
                    cancelBtn.clicked()
                    let token = /access_token=([^&]+)/.exec(loadRequest.url)[1]
                    tokenLabel.text = token
                    auth(token)
                }
            }
        }

        Label {
            id: tokenLabel
//            Layout.fillWidth: true
//            Layout.fillHeight: true
            Layout.alignment: Qt.AlignCenter
            font.pointSize: 20
            wrapMode: Text.WrapAnywhere
            visible: false
        }

        ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            visible: true

            ListView {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.leftMargin: 10
                Layout.rightMargin: 10

                model: ListModel {
                    id: friendsModel
                }

                delegate: RowLayout {
                    Image {
                        source: model.pic_small
                        Layout.margins: 10
                        Layout.preferredWidth:  50
                        Layout.preferredHeight: 50
                        fillMode: Image.PreserveAspectFit
                    }
                    Label {
                        Layout.fillWidth: true
                        text: model.first_name + " " + model.last_name
                        font.pointSize: 30
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }
        }

        Connections {
            target: root
            function onFriends(data) {
                friendsModel.clear()
                const r = JSON.parse(data)
                for (const e of r) {
                    friendsModel.append(e)
                }
            }
        }
    }
}
