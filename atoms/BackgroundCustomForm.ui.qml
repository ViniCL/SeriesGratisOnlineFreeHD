import QtQuick 2.15

Rectangle {
    id: root

    width: 300
    height: 200
    border.color: "lightgray"
    border.width: 2
    radius: 10
    color: "white"
    smooth: true

    Rectangle{
        id:cornerTopLeft

        visible: vHasCornersWithCircles

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

        visible: vHasCornersWithCircles

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

        visible: vHasCornersWithCircles

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

        visible: vHasCornersWithCircles

        radius:10

        height: 20
        width: 20

        color: root.border.color

        anchors{
            right: root.right
            bottom: root.bottom
        }
    }
}
