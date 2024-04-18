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
        anchors.fill: root
    }

    Image {
        id: thumbnail

        anchors.top: root.top
        anchors.horizontalCenter: root.horizontalCenter
        anchors.topMargin: root.height / 28

        source: "../styles/images/defaultCardImage2.png"
        width: root.width / 1.3
        height: root.height / 1.3
        fillMode: Image.PreserveAspectFit
        asynchronous: true

        visible: status === Image.Ready
    }

    Rectangle{
        id:thumbnailMask

        height: thumbnail.height * 1.05
        width: thumbnail.width * 1.18
        anchors.centerIn: thumbnail
        border.color: root.color
        border.width: thumbnail.width / 9.8
        radius: 30
        color: "transparent"
    }


    BusyIndicator {
        id: busyIndicator
        visible: img.status === Image.Loading
        anchors.centerIn: root
        width: root.width / 3
        height: root.height / 3
    }


    Text {
        id: title

        anchors.horizontalCenter: root.horizontalCenter
        anchors.bottom: starRow.top
        anchors.bottomMargin: root.height / 80

        text: vTitle
        font.bold: true
        maximumLineCount: 1
        font.pixelSize: thumbnail.width / 10
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
        anchors.bottomMargin: root.height / 30

        Image {
            id: starIcon
            source: "../styles/icones/star.png"
            width: thumbnail.width / 8
            height: thumbnail.width / 8
        }

        Text {
            id: ratingText
            text: vNota
            font.bold: true
            maximumLineCount: 1
            font.pixelSize: thumbnail.width / 9
            elide: Text.ElideRight
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignLeft
            Layout.maximumWidth: thumbnail.width
        }
    }

}
