import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "../styles/icones"

Rectangle {
    id: root
    width: 300
    height: 200
    border.color: "lightgray"
    border.width: 2
    radius: 10
    color: mouseArea.containsPress ? "lightgray" : "white"
    smooth: true

    property alias mouseArea: mouseArea

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }

    ColumnLayout{
        id: column
        anchors.centerIn: parent

        anchors.top: root.top
        anchors.topMargin: 20

        spacing: 10

        Image {
            id: thumbnail
            source: vImageUrl
            width: parent.width
            height: parent.height
            fillMode: Image.PreserveAspectFit

        }

        Text {
            id: title
            text: vTitle
            font.bold: true
            maximumLineCount: 2
            font.pixelSize: 20
            elide: Text.ElideRight
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignLeft
            Layout.maximumWidth: thumbnail.width
        }

        Row {
            id: starRow


            Image {
                id: starIcon
                source: "../styles/icones/star.png"
                width: 20
                height: 20
            }

            Text {
                id: ratingText
                text: vNota
                font.bold: true
            }
        }
    }


}
