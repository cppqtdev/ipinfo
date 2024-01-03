// Copyright (C) 2024 Adesh Singh

import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

TextField {
    id:control
    property bool isBold: false
    property real radius: 12
    property color borderColor: activeFocus ? appStyle.appStyle : appStyle.borderColor

    placeholderTextColor: appStyle.textColor

    font.pixelSize: fontStyle.h3
    font.bold: isBold ? Font.Bold : Font.Normal
    font.weight: isBold ? Font.Bold : Font.Normal

    color: appStyle.textColor

    background:Rectangle{
        implicitHeight: control.implicitHeight
        implicitWidth: control.implicitWidth
        radius: control.radius
        color: appStyle.popupBackground
        border.width:  control.activeFocus ? 2 : 1
        border.color: control.borderColor
    }

    QtObject {
        id:appStyle
        readonly property color background: "#232429"
        readonly property color hoverColor: "#2a2d36"
        readonly property color textBackground: "#2b2f3b"
        readonly property color popupBackground: "#f2f2f2"
        readonly property color appStyle: "#007aff"
        readonly property color labelColor: "#85889b"
        readonly property color textColor: "#000"
        readonly property color borderColor: "#464a53"
        readonly property color placeholderColor: "#757985"
    }

    QtObject {
        id:fontStyle
        readonly property int       h1 : 32
        readonly property int       h2 : 24
        readonly property double    h3 : 18.72
        readonly property int       h4 : 16
        readonly property double    h5 : 13.28
        readonly property double    h6 : 10.72
        readonly property int content : 14
    }
}
