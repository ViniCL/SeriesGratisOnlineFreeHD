import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import atoms 1.0

import "../styles/icones"
import "../styles/images"


BackgroundCustom {
    id: root
    width: 300
    height: 200
    border.width: 2
    radius: 10
    color: mouseArea.containsPress ? "lightgray" : "#f0f0f0"
    smooth: true

    property alias mouseArea: mouseArea
    property alias thumbnail:thumbnail
    property alias busyIndicator:busyIndicator

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }

    Image {
        id: thumbnail

        anchors.top: root.top
        anchors.horizontalCenter: root.horizontalCenter
        anchors.topMargin: 16

        source: "../styles/images/defaultCardImage.png"
        width: parent.width / 1.3
        height: parent.height / 1.3
        fillMode: Image.PreserveAspectFit
        asynchronous: true

        visible: status === Image.Ready

    }

    BusyIndicator {
        id: busyIndicator
        visible: img.status === Image.Loading
        anchors.centerIn: parent
        width: parent.width / 3
        height: parent.height / 3
    }


    Text {
        id: title

        anchors.bottom: starRow.top
        anchors.horizontalCenter: root.horizontalCenter
        anchors.bottomMargin: 6

        text: vTitle
        font.bold: true
        maximumLineCount: 1
        font.pixelSize: 20
        elide: Text.ElideRight
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignLeft
        width: thumbnail.width
    }

    Row {
        id: starRow
        spacing: 4

        anchors.bottom: root.bottom
        anchors.left: thumbnail.left
        anchors.bottomMargin: 18

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
            Layout.maximumWidth: thumbnail.width
        }
    }

}
