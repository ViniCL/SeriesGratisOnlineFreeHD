import QtQuick 2.15
import QtQuick.Controls 2.15
import atoms 1.0
import molecules 1.0
import SerieInfoDTO 1.0

Item {
    id: root

    signal returnToMain()

    property int vIdSerie
    property serieInfoDTO _serieInfo


    onVIdSerieChanged: {
        _serieInfo = mainControl.searchOneSerieById(vIdSerie)
    }


    on_SerieInfoChanged: {
        infoComponent.vTitle = _serieInfo.name
        infoComponent.vMainImageUrl = _serieInfo.image
        infoComponent.vDescription = _serieInfo.summary
        infoComponent.vRating = _serieInfo.rating
        infoComponent.vSecondaryImageUrl = _serieInfo.image
        infoComponent.vGenres = _serieInfo.genres

    }

    Rectangle{
        id:background

        anchors.fill: parent
/*
        gradient: Gradient {
            GradientStop { position: -0.2; color: "#cca300" }
            GradientStop { position: 1.0; color: "#272727" }
        }
*/

        gradient: Gradient {
            GradientStop { position: -0.2; color: "#6c2519" }
            GradientStop { position: 1.0; color: "#070000" }
        }


    }

    InfoComponent{
        id:infoComponent

        anchors.fill: background
        anchors.margins: 30
        anchors.bottomMargin: 90

    }

    ButtonCustom{
        id: btn

<<<<<<< Updated upstream
        anchors.top: infoComponent.bottom
        anchors.margins: 10
        anchors.horizontalCenter: infoComponent.horizontalCenter

        width: 70
        height: 70
=======
<<<<<<< Updated upstream
        width: root.height / 15
        height: root.height / 15

        anchors.bottom: root.bottom
        anchors.bottomMargin: root.height / 120
        anchors.horizontalCenter: root.horizontalCenter


=======
<<<<<<< Updated upstream
        anchors.top: infoComponent.bottom
        anchors.margins: 10
        anchors.horizontalCenter: infoComponent.horizontalCenter

        width: 70
        height: 70
=======
<<<<<<< Updated upstream
        width: root.height / 15
        height: root.height / 15

        anchors.bottom: root.bottom
        anchors.bottomMargin: root.height / 120
        anchors.horizontalCenter: root.horizontalCenter


=======
<<<<<<< Updated upstream
        anchors.top: infoComponent.bottom
        anchors.margins: 10
        anchors.horizontalCenter: infoComponent.horizontalCenter

        width: 70
        height: 70
=======
        width: root.height / 15
        height: root.height / 15

        anchors.bottom: root.bottom
        anchors.bottomMargin: root.height / 120
        anchors.horizontalCenter: root.horizontalCenter
>>>>>>> Stashed changes
>>>>>>> Stashed changes
>>>>>>> Stashed changes
>>>>>>> Stashed changes
>>>>>>> Stashed changes

        onClicked: returnToMain()
    }


}
