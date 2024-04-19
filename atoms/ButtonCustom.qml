import QtQuick 2.15

ButtonCustomForm{
    id:root

    property string vIcon;

    onVIconChanged: {
        root.icon.source = vIcon;
    }

}
