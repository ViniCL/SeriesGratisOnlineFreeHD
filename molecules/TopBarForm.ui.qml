import QtQuick 2.15
import QtQuick.Layouts 2.15
import atoms 1.0

Rectangle{
    id: root

    property alias background : background
    property alias search : search

    color: "transparent"

    Rectangle{
        id:background

        anchors.fill: root

    }

    RowLayout {
        id: row
        anchors.fill: background
        anchors.centerIn: background
        spacing: 10

        anchors{
            leftMargin: 20
            rightMargin: 20
            topMargin: 20
            bottomMargin: 20
        }

        InputFieldCustom{
            id: search

            Layout.fillWidth: true
            Layout.fillHeight: true


        }


    }


}
