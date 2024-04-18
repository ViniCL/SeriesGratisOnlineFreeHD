import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import atoms 1.0

import "../styles/icones"

BackgroundCustom {
    id: root

    width: 400
    height: 200
    border.color: "lightgray"
    border.width: 10
    radius: 10
    smooth: true

    vHasCornersWithCircles: true

    Text {
        id: title

        anchors.top: root.top
        anchors.topMargin: root.height / 30
        anchors.horizontalCenter: root.horizontalCenter

        text: vTitle
        font.bold: true
        maximumLineCount: 2
        font.pixelSize: mainImage.width / 8
        elide: Text.ElideRight
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        width: mainImage.width * 1.5

    }

    Image {
        id: mainImage

        anchors.top: title.bottom
        anchors.topMargin: root.height / 60
        anchors.horizontalCenter: root.horizontalCenter

        source: vMainImageUrl.length > 1 ? vMainImageURL : "../styles/images/defaultCardImage2.png"
        width: root.width / 2.2
        height: root.height / 4
        fillMode: Image.PreserveAspectFit

    }

    ColumnLayout {
        id:column

        width: root.width * 0.8

        anchors.top: mainImage.bottom
        anchors.topMargin: root.height / 50
        anchors.horizontalCenter: root.horizontalCenter

        spacing: 4

        Text {
            id:descricao
            text: vDescription
            maximumLineCount: 14
            font.pixelSize: mainImage.width / 11
            elide: Text.ElideRight
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignLeft
            Layout.maximumWidth: column.width

        }

        Row {
            id: generosRow
            spacing: 2

            Text {
                id:generos
                text: "Genres: "
                font.bold: true
                maximumLineCount: 10
                font.pixelSize: mainImage.width / 11
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignLeft
                Layout.maximumWidth: column.width
            }

            Text {
                id:generosList
                text: vGenres.length > 1 ? vGenres.join(", ") : "All"
                maximumLineCount: 10
                font.pixelSize: mainImage.width / 11
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignLeft
                Layout.maximumWidth: column.width
            }

        }
    }

    Row {
        id: starRow

        spacing: 4

        anchors.bottom: root.bottom
        anchors.bottomMargin: root.width / 16
        anchors.horizontalCenter: root.horizontalCenter

        Image {
            id: star
            source:  "../styles/icones/star.png"
            width: mainImage.width / 5
            height: mainImage.width / 5
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: nota
            text: vRating.toFixed(1)
            font.bold: true
            maximumLineCount: 1
            font.pixelSize: mainImage.width / 6
            elide: Text.ElideRight
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignLeft
            Layout.maximumWidth: column.width
        }
    }

}
