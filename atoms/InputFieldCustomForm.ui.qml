import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects
import "../styles/icones"

Rectangle {
    id: root
    width: 200
    height: 40
    radius: 10
    border.color: "lightgray"
    border.width: 2

    property alias input: input
    property alias delayTimer: delayTimer
    property alias clearButton: clearButton

    RowLayout {
        anchors.fill: parent

        TextField {
            id: input
            Layout.fillWidth: true
            Layout.fillHeight: true

            Layout.leftMargin: 5
            verticalAlignment: Text.AlignVCenter

            placeholderText: "Em alta"
            font.pixelSize: root.height * 0.5
            cursorVisible: true
            selectionColor: "lightblue"
            selectedTextColor: "black"
            color: "black"
            focus: true
            selectByMouse: true

            background: null

        }

        Timer {
            id: delayTimer
            interval: 500
            repeat: false
            running: false
        }

        MouseArea {
            id: clearButton
            width: root.width / 6
            height: root.height
            visible: input.text.length > 0

            Image {
                id:clearImage
                source: "../styles/icones/apagar.png"
                anchors.right: clearButton.right
                anchors.rightMargin: 25
                anchors.verticalCenter: clearButton.verticalCenter
                width: clearButton.width / 1.4
                height: clearButton.height / 1.4
                fillMode: Image.PreserveAspectFit
                visible: false

            }

            ColorOverlay{
                id:colorOverlay
                anchors.fill: clearImage
                enabled: true
                source: clearImage
                color: "lightgray"
                smooth: true
            }
        }
    }

}
