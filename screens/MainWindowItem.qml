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

    signal cardClicked(int idSerie, string imagem, string name, real rating)

    property bool _showKeyboard: false
    property real _inputPanelStartPosition: root.height - inputPanel.height
    property SeriesAbstractModel vSeriesAbstractModel : SeriesAbstractModel{
        id: seri

        onRetrieveNewSeries: function(currentPage){
                vSeriesAbstractModel.newSeriesSearched = mainControl.getListaSeriesCortada(currentPage)
        }

    }

    on_ShowKeyboardChanged: _showKeyboard ? animacaoEntrada.start() : animacaoSaida.start()

    function doSearch(pesquisa){
        vSeriesAbstractModel.resetCurrentPage()
        mainControl.resetLastIndexRetrieved()
        mainControl.doSearchAllSeries(pesquisa)
        vSeriesAbstractModel.series = mainControl.getListaSeriesCortada(vSeriesAbstractModel.getCurrentPage());

    }

    Component.onCompleted: {
        doSearch("")
    }

    Rectangle{
        id:background

        anchors.fill: root

        gradient: Gradient {
            GradientStop { position: -0.2; color: "#6c2519" }
            GradientStop { position: 1.0; color: "#070000" }
        }

    }

    Text{
        id:tvMazeCredits
        text: "Powered by TVmaze API & ViniCL"
        color: "#c0c0c0"
        font.pixelSize: root.width / 38
        anchors.horizontalCenter: background.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.topMargin: 0
        height: root.height / 64
        width: root.width / 3
    }

    Image {
        id:logoImage
        source: "../styles/images/logoSeriesGratisOnlineFreeHD2.png"
        anchors.top: background.top
        anchors.topMargin: root.height / 42
        height: root.height / 16
        width: root.width / 1.2
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


    TopBar{
        id: topBar

        anchors.top: root.top
        anchors.topMargin: root.height / 15.5
        height: background.height / 8.2
        width: background.width

        vColor: "transparent"

        onPesquisaChanged: function(pesquisa){
            doSearch(pesquisa)
            msgDadosNaoEncontrados.visible = !vSeriesAbstractModel.rowCount()
        }

        onInputFocusChanged:function(focus){
            _showKeyboard = focus;

        }

    }


    Rectangle{
       id:gridBackground
       color: "transparent"

       anchors.horizontalCenter: background.horizontalCenter
       anchors.bottom: background.bottom

       width: background.width / 1.1
       height: background.height / 1.2

       Text{
           id:msgDadosNaoEncontrados
           text: "Nada encontrado :("
           color: "#c0c0c0"
           font.bold: true
           anchors.centerIn: gridBackground
           horizontalAlignment: Text.AlignHCenter
           height: root.height / 10
           width: root.width / 3
           font.pixelSize: root.width / 14
           visible: false
       }

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

            cacheBuffer:0

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
                    vTitle: name
                    vRating: rating


                    onClicked: cardClicked(idSerie, imagem, name, rating)
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

        onStopped: {
            inputPanel.visible = false
            topBar.search.input.focus = false
        }
    }

}
