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
        anchors.topMargin: 20
        anchors.horizontalCenter: root.horizontalCenter

        text: vTitle
        font.bold: true
        maximumLineCount: 2
        font.pixelSize: 30
        elide: Text.ElideRight
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        width: mainImage.width + 20

    }

    Image {
        id: mainImage

        anchors.top: title.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: root.horizontalCenter

        source: vMainImageUrl
        width: root.width / 2
        height: root.height / 3.5
        fillMode: Image.PreserveAspectFit

    }

    ColumnLayout {
        id:column

        width: root.width * 0.8

        anchors.top: mainImage.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: root.horizontalCenter

        spacing: 14

        Text {
            id:descricao
            text: vDescription
            maximumLineCount: 18
            font.pixelSize: 18
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
                font.pixelSize: 18
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignLeft
                Layout.maximumWidth: column.width
            }

            Text {
                id:generosList
                text: vGenres.join(", ")
                maximumLineCount: 10
                font.pixelSize: 18
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignLeft
                Layout.maximumWidth: column.width
            }


        }
    }

    Row {
        id: starRow

        spacing: 7

        anchors.bottom: root.bottom
        anchors.bottomMargin: 40
        anchors.horizontalCenter: root.horizontalCenter


        Image {
            id: star
            source:  "../styles/icones/star.png"
            width: 70
            height: 70
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: rating
            text: vRating.toFixed(1)
            font.bold: true
            maximumLineCount: 1
            font.pixelSize: 50
            elide: Text.ElideRight
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignLeft
            Layout.maximumWidth: column.width
        }
    }


    /*Image {
        source: vSecondaryImageUrl
        width: 100
        height: 100
        fillMode: Image.PreserveAspectFit

    }*/

}
