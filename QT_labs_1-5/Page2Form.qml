import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtMultimedia 5.15

Page {
    GridLayout{
        anchors.fill: parent
        columns: 1
        rows:3
        RowLayout{
//            Layout.fillWidth: true
//            Layout.columnSpan: 4
            Layout.row: 0
            Layout.column: 0
            Layout.alignment: Qt.AlignCenter

//            Item{
//                Layout.fillWidth: true
//            }

            RadioButton{
                id: videobut
                checked: true
                text: qsTr("Просмотр видео")
            }


            RadioButton{
                id: cambut
                text: qsTr("Веб-камера")
            }
        }
        RowLayout {
            visible: {if(videobut.checked){true}else{false}}
//            Layout.fillWidth: true
//            Layout.fillHeight: true
            Layout.row: 2
            Layout.column: 0
            Layout.alignment: Qt.AlignCenter

            VideoOutput {
                id: v4
                Layout.fillWidth: true
                Layout.fillHeight: true
                source: video
                ProgressBar {
                    id: pb
                    anchors.left: parent.left
                    anchors.right: parent.right
                    MouseArea {
                        id: pbma
                        anchors.fill: parent
                        onClicked: {
                            if (v4.source !== video) {
                                return;
                            }
                            video.seek(mouseX / width * video.duration)
                            timer.onTriggered()
                        }

                        focus: true
                    }
                }
            }
            MouseArea {
                id: mause
            }

            MediaPlayer{
                id: video
                source: "vid/sample.mp4"
                autoPlay: true
                volume: vol.value

                Component.onCompleted: { video.play(); video.pause() }
                onPlaying: {
                    pb.to = video.duration
                    timer.start()
                }

                onStopped: {
                    timer.stop()
                    pb.value = 0
                }

                onPaused: {
                    timer.stop()
                }
            }
            Timer {
                id: timer
                interval: 16
                repeat: true
                onTriggered: pb.value = video.position
            }
        }
        RowLayout{
            visible: {if(videobut.checked){true}else{false}}
//            Layout.fillWidth: true
//            Layout.columnSpan: 4
            Layout.row: 3
            Layout.column: 0
            Layout.alignment: Qt.AlignCenter
//            anchors.centerIn: parent

            Text {
                text: qsTr("Громкость:")
                font.pixelSize: 15
            }

            Slider{
                Layout.alignment: Layout.left
                id: vol
                from: 0
                value: 0.5
                to:1
                stepSize: 0.1
            }

            RoundButton {
                id: rb
                Layout.alignment: Layout.Center
                text: video.playbackState === MediaPlayer.PlayingState ? "pause" : "play"
                onClicked: video.playbackState === MediaPlayer.PlayingState ?
                               video.pause() : video.play()
            }
        }

        //Камера
        //Захват видео
        RowLayout{
            visible: {if(cambut.checked){true}else{false}}
            Layout.row: 0
            Layout.column: 0
            Layout.alignment: Qt.AlignCenter

            Item{
                Layout.fillWidth: true
            }
            Rectangle{
                width: 400
                height: 200

                Camera {
                    id: camera
                    imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash //Баланс белого цвета на выходном видео
                    videoRecorder.audioEncodingMode: CameraRecorder.ConstantBitrateEncoding; //Задаем то, что битрейт будет всегда константным
                    videoRecorder.audioBitRate: 48000 //количество бит, используемых для передачи/обработки данных в единицу времени
                    videoRecorder.mediaContainer: "mp4" //формат видео
                    videoRecorder.outputLocation: "D:/QTlabs/lab1/video"
                    videoRecorder.frameRate: 30.000 //30 кадров в секунду съемка

                    exposure { //Экспозиция камеры
                        exposureCompensation: -1.0
                        exposureMode: Camera.ExposurePortrait //Портретная экспозиция
                    }

                    imageCapture {
                        onImageCaptured: {
                            photoPreview.source = preview

                        }
                    }
                }

                VideoOutput {
                    source: camera
                    anchors.fill: parent
                    focus : visible
                }
            }

            Item{
                Layout.fillWidth: true
            }


        }

        RowLayout{
            visible: {if(cambut.checked){true}else{false}}
            Layout.alignment: Qt.AlignCenter
            Layout.row: 3
            Layout.column: 0

            Item{
                Layout.fillWidth: true
            }

            Button{ //Кнопка снимка
                text: "Снимок"
                onClicked: camera.imageCapture.captureToLocation("D:/QTlabs/lab1/img")
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    border.width: 1
                    radius: 4
                }
            }

            Button{ //Кнопка записи
                text: "Запись"
                onClicked: camera.videoRecorder.record()
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    border.width: 1
                    radius: 4
                }
            }

            Button{ //Кнопка остановки записи
                text: "Стоп запись"
                onClicked: camera.videoRecorder.stop()
                Layout.alignment: Qt.AlignCenter
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    border.width: 1
                    radius: 4
                }
            }

            Rectangle{ //Квадрат для показывания превью скриншота
                width: 100
                height: 60

                Image {
                    id: photoPreview
                    anchors.fill: parent
                }
                MouseArea{
                }
            }
            Item{
                Layout.fillWidth: true
            }
        }
    }
}

