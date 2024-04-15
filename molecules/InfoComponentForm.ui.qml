import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "../styles/icones"

Rectangle {
    id: root

    width: 400
    height: 200
    border.color: "lightgray"
    border.width: 10
    radius: 10
    smooth: true

    Rectangle{
        id:cornerTopLeft

        radius:10

        height: 20
        width: 20

        color: root.border.color

        anchors{
            left: root.left
            top: root.top
        }
    }

    Rectangle{
        id:cornerTopRight

        radius:10

        height: 20
        width: 20

        color: root.border.color

        anchors{
            right: root.right
            top: root.top
        }
    }

    Rectangle{
        id:cornerBottomLeft

        radius:10

        height: 20
        width: 20

        color: root.border.color

        anchors{
            left: root.left
            bottom: root.bottom
        }
    }

    Rectangle{
        id:cornerBottomRight

        radius:10

        height: 20
        width: 20

        color: root.border.color

        anchors{
            right: root.right
            bottom: root.bottom
        }
    }

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

        anchors.top: mainImage.bottom
        anchors.topMargin: 20

        width: root.width * 0.8

        anchors.horizontalCenter: root.horizontalCenter

        spacing: 10


        Text {
            text: vDescription
            maximumLineCount: 15
            font.pixelSize: 18
            elide: Text.ElideRight
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignLeft
            Layout.maximumWidth: column.width

        }

        Text {
            text: "Gêneros: " + vGenres.join(", ")
            maximumLineCount: 10
            font.pixelSize: 15
            elide: Text.ElideRight
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignLeft
            Layout.maximumWidth: column.width
        }

        Row {
            spacing: 5
            Image {
                source:  "../styles/icones/star.png"
                width: 60
                height: 60
                fillMode: Image.PreserveAspectFit
            }
            Text {
                text: vRating.toFixed(1)
                maximumLineCount: 10
                font.pixelSize: 20
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignLeft
                Layout.maximumWidth: column.width
            }
        }
    }

    /*Image {
        source: vSecondaryImageUrl
        width: 100
        height: 100
        fillMode: Image.PreserveAspectFit

    }*/

}
