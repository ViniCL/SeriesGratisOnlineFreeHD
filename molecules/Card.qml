import QtQuick 2.15

CardForm{
    id: root

    signal clicked()

    property string vTitle
    property string vImageUrl
    property real vNota

    mouseArea.onReleased: root.clicked()

    onVImageUrlChanged: thumbnail.source = vImageUrl ? vImageUrl : "../styles/images/defaultCardImage.png"

    thumbnail.onStatusChanged: {
        if (thumbnail.status === Image.Loading) {
            busyIndicator.visible = true;
        } else {
            busyIndicator.visible = false;
        }
    }

}
