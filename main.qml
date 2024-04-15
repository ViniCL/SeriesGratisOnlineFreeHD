import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import atoms 1.0
import molecules 1.0
import screens 1.0
import MainWindowControl 1.0
import SeriesAbstractModel 1.0
//import QtQuick.VirtualKeyboard 2.15
//import QtQuick.VirtualKeyboard.Styles 2.15
//import QtQuick.VirtualKeyboard.Settings 2.15

ApplicationWindow {
    id: root
    width: 640
    height: 1136
    visible: true
    title: qsTr("POS SCREEN")

    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width

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

            onCardClicked: function(id){

                view.currentIndex = 1
                serieInfoScreen.vIdSerie = id
            }
        }

        SerieInfoItem {
            id: serieInfoScreen

            onReturnToMain: view.currentIndex = 0

        }

    }

    /*InputPanel {
        id: inputPanel
        width: parent.width
        x: 0
        y: root.height - inputPanel.height
        z: 10000
        visible: true

    }*/


}
