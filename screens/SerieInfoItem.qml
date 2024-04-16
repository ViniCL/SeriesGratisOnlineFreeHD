import QtQuick 2.15
import QtQuick.Controls 2.15
import atoms 1.0
import molecules 1.0
import SerieInfoDTO 1.0

Item {
    id: root

    signal returnToMain()

    property int vIdSerie
    property real vRating
    property string vMainImageURL
    property string vTitle

    property serieInfoDTO _serieInfo

    onVIdSerieChanged: {
        infoComponent.vTitle = vTitle
        infoComponent.vMainImageUrl = vMainImageURL
        infoComponent.vRating = vRating
        _serieInfo = mainControl.searchOneSerieById(vIdSerie)
    }

    on_SerieInfoChanged: {
        infoComponent.vDescription = _serieInfo.summary
        infoComponent.vGenres = _serieInfo.genres
    }

    Rectangle{
        id:background

        anchors.fill: parent

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

        anchors.top: infoComponent.bottom
        anchors.margins: 10
        anchors.horizontalCenter: infoComponent.horizontalCenter

        width: 70
        height: 70

        onClicked: returnToMain()
    }


}
