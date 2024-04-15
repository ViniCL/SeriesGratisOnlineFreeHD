import QtQuick 2.15
import QtQuick.Controls 2.15
import atoms 1.0
import molecules 1.0
import SeriesAbstractModel 1.0

Item {
    id:root

    signal cardClicked(int idSerie)

    Component.onCompleted: {
        vSeriesAbstractModel.series = mainControl.doSearchAllSeries("");
    }

    property SeriesAbstractModel vSeriesAbstractModel : SeriesAbstractModel{
        id: seri

    }

    Rectangle{
        id:background

        anchors.fill: root

        color: "#cca300"

    }

    TopBar{
        id: topBar

        vColor: background.color

        onPesquisaChanged: function(pesquisa){
            vSeriesAbstractModel.series = mainControl.doSearchAllSeries(pesquisa);
        }

        anchors.top: background.top
        anchors.topMargin: 40
        width: parent.width
        height: parent.height / 8
    }


    Rectangle{
       id:gridBkg
       color: background.color

       anchors.horizontalCenter: background.horizontalCenter
       anchors.top: topBar.bottom

       width: parent.width - 40
       height: parent.height / 1.2


        GridView{
            id:tempList

            anchors.centerIn: parent
            width: parent.width
            height: parent.height // 2
            clip: true

            cellWidth: tempList.width / 2
            cellHeight: tempList.height / 2.2

            //cacheBuffer:

            delegate: Rectangle{
                id: delegateBackground

                width: tempList.cellWidth
                height: tempList.cellHeight
                color: background.color

                Card {

                    width: tempList.cellWidth - 10
                    height: tempList.cellHeight - 10

                    anchors.centerIn: parent

                    vImageUrl: imagem
                    vTitle: nome
                    vNota: nota


                    onClicked: cardClicked(idSerie)
                }
            }

            model: vSeriesAbstractModel

        }
    }

}
