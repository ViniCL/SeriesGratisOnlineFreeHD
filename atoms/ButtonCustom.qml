import QtQuick 2.15

ButtonCustomForm{
    id:root

    property var vIcon;

    onVIconChanged: {
        root.icon.source = vIcon;
        root.icon.height = parent.height
        root.icon.width = parent.width
    }

}
