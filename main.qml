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

    property int _idxMainWindow: 0
    property int _idxInfoScreen: 1

    MainWindowControl{
        id: mainControl

    }

    SwipeView {
        id: view

        interactive: false
        currentIndex: _idxMainWindow
        anchors.fill: parent

        MainWindowItem{
            id:mainWindowScreen

            onCardClicked: function(id, imagem, name, rating){
                serieInfoScreen.vMainImageURL = imagem
                serieInfoScreen.vTitle = name
                serieInfoScreen.vRating = rating
                serieInfoScreen.vIdSerie = id
                view.currentIndex = _idxInfoScreen
            }
        }

        SerieInfoItem {
            id: serieInfoScreen

            vIdSerie: _idSerieInfoInicial
            onReturnToMain: view.currentIndex = _idxMainWindow

        }

    }

}
