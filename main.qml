import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import atoms 1.0
import molecules 1.0
import screens 1.0
import MainWindowControl 1.0
import SeriesAbstractModel 1.0

ApplicationWindow {
    id: root
    width: 384;
    height: 680;
    visible: true
    title: qsTr("POS SCREEN")

    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width

    property int _idSerieInfoInicial: 1

    MainWindowControl{
        id: mainControl

    }

    SwipeView {
        id: view

        interactive: false
        currentIndex: 0
        anchors.fill: parent

        MainWindowItem{
            id:mainWindowScreen

            onCardClicked: function(id, imagem, nome, rating){
                serieInfoScreen.vMainImageURL = imagem
                serieInfoScreen.vTitle = nome
                serieInfoScreen.vRating = rating
                serieInfoScreen.vIdSerie = id
                view.currentIndex = 1
            }
        }

        SerieInfoItem {
            id: serieInfoScreen

            vIdSerie: _idSerieInfoInicial
            onReturnToMain: view.currentIndex = 0

        }

    }

}
