import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import atoms 1.0

import "../styles/icones"

BackgroundCustom {
    id: root
    width: 300
    height: 200
    border.width: 2
    radius: 10
    color: mouseArea.containsPress ? "lightgray" : "#f0f0f0"
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
            spacing: 4

            Image {
                id: starIcon
                source: "../styles/icones/star.png"
                width: 25
                height: 25
            }

            Text {
                id: ratingText
                text: vNota
                font.bold: true
                maximumLineCount: 1
                font.pixelSize: 18
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignLeft
                Layout.maximumWidth: column.width
            }
        }
    }


}
