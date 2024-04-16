import QtQuick 2.15
import QtQuick.Controls 2.15
import atoms 1.0
import molecules 1.0
import SeriesAbstractModel 1.0
import QtQuick.VirtualKeyboard 2.15
import QtQuick.VirtualKeyboard.Styles 2.15
import QtQuick.VirtualKeyboard.Settings 2.15


Item {
    id:root

    signal cardClicked(int idSerie, string imagem, string nome, real nota)

    property bool _showKeyboard: false
    property real _inputPanelStartPosition: root.height - inputPanel.height
    property SeriesAbstractModel vSeriesAbstractModel : SeriesAbstractModel{
        id: seri

    }

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
        anchors.topMargin: 40
        width: parent.width
        height: parent.height / 8
    }


    Rectangle{
       id:gridBkg
       color: "transparent"


       anchors.horizontalCenter: background.horizontalCenter
       anchors.top: topBar.bottom

       width: parent.width - 40
       height: parent.height / 1.2


        GridView{
            id:tempList

            anchors.centerIn: parent
            width: parent.width
            height: parent.height
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

                    anchors.centerIn: parent

                    vImageUrl: imagem
                    vTitle: nome
                    vNota: nota


                    onClicked: cardClicked(idSerie, imagem, nome, nota)
                }
            }

            model: vSeriesAbstractModel

        }
    }

    on_ShowKeyboardChanged: _showKeyboard ? animacaoEntrada.start() : animacaoSaida.start()


    InputPanel {
        id: inputPanel
        width: parent.width
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
