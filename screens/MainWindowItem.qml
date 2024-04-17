import QtQuick 2.15
import QtQuick.Controls 2.15
import atoms 1.0
import molecules 1.0
import SeriesAbstractModel 1.0
import QtQuick.VirtualKeyboard 2.15
import QtQuick.VirtualKeyboard.Styles 2.15
import QtQuick.VirtualKeyboard.Settings 2.15
import Qt5Compat.GraphicalEffects

Item {
    id:root

    signal cardClicked(int idSerie, string imagem, string nome, real nota)

    property bool _showKeyboard: false
    property real _inputPanelStartPosition: root.height - inputPanel.height
    property SeriesAbstractModel vSeriesAbstractModel : SeriesAbstractModel{
        id: seri

    }

    on_ShowKeyboardChanged: _showKeyboard ? animacaoEntrada.start() : animacaoSaida.start()

    Component.onCompleted: {
        vSeriesAbstractModel.series = mainControl.doSearchAllSeries("");
    }

    Rectangle{
        id:background

        anchors.fill: root

        gradient: Gradient {
            GradientStop { position: -0.2; color: "#6c2519" }
            GradientStop { position: 1.0; color: "#070000" }
        }

    }

    Image {
        id:logoImage
        source: "../styles/images/logoSeriesGratisOnlineFreeHD2.png"
        anchors.top: background.top
        anchors.topMargin: 22
        height: 55
        width: 440
        anchors.horizontalCenter: background.horizontalCenter
        visible: false

    }

    ColorOverlay{
        id:colorOverlay
        anchors.fill: logoImage
        enabled: true
        source: logoImage
        color: "#c0c0c0"
        smooth: true
    }

    Text{
        id:tvMazeCredits
        text: "Powered by TVmaze API & ViniCL"
        color: "#c0c0c0"
        anchors.horizontalCenter: background.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.topMargin: 0
        height: 10
        width: 10
    }


    TopBar{
        id: topBar

        vColor: "transparent"

        onPesquisaChanged: function(pesquisa){
            vSeriesAbstractModel.series = mainControl.doSearchAllSeries(pesquisa);
        }

        onInputFocusChanged:function(focus){
            _showKeyboard = focus;

        }

        anchors.top: background.top
        anchors.topMargin: 70
        width: background.width
        height: background.height / 9
    }


    Rectangle{
       id:gridBackground
       color: "transparent"

       anchors.horizontalCenter: background.horizontalCenter
       anchors.bottom: background.bottom

       width: background.width - 40
       height: background.height / 1.2


        GridView{
            id:tempList

            anchors.centerIn: gridBackground
            width: gridBackground.width
            height: gridBackground.height
            clip: true

            onMovingChanged: {
                topBar.search.input.focus = false

            }

            cellWidth: tempList.width / 2
            cellHeight: tempList.height / 2.2

            //cacheBuffer:

            delegate: Rectangle{
                id: delegateBackground

                width: tempList.cellWidth
                height: tempList.cellHeight
                color: "transparent"


                Card {

                    width: tempList.cellWidth - 10
                    height: tempList.cellHeight - 10

                    anchors.centerIn: delegateBackground

                    vImageUrl: imagem
                    vTitle: nome
                    vNota: nota


                    onClicked: cardClicked(idSerie, imagem, nome, nota)
                }
            }

            model: vSeriesAbstractModel

        }
    }

    InputPanel {
        id: inputPanel
        width: background.width
        x: 0
        y: _inputPanelStartPosition
        z: 10000
        visible: false

    }

    NumberAnimation{
        id: animacaoEntrada
        target: inputPanel
        property: "y"
        from: root.height
        to: _inputPanelStartPosition
        duration: 200

        onStarted: inputPanel.visible = true
    }

    NumberAnimation{
        id: animacaoSaida
        target: inputPanel
        property: "y"
        from: _inputPanelStartPosition
        to: root.height
        duration: 200

        onStopped: inputPanel.visible = false
    }

}
