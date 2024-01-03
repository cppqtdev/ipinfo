// Copyright (C) 2024 Adesh Singh

import QtQuick 2.9
import QtQuick.Controls 2.5

Button {
    id: shortButton
    background: Rectangle {
        id: shortButtonBack
        anchors.fill: parent
        color: "#171c26"
        radius: 6
        z: 2
    }
    contentItem: Text {
        text: shortButton.text
        font.bold: false
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        opacity: enabled ? 1.0 : 0.3
        color: "#fff"
        anchors.fill: parent
        elide: Text.ElideRight
        scale: shortButton.down ? 0.9 : 1.0
        z: 3
        Behavior on scale {
            NumberAnimation {duration: 70;}
        }
    }
}

