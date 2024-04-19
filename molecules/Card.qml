import QtQuick 2.15

CardForm{
    id: root

    signal clicked()

    property string vTitle
    property string vImageUrl
    property real vRating

    mouseArea.onReleased: root.clicked()

}
