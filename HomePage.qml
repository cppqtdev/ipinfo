// Copyright (C) 2024 Adesh Singh

import QtQuick 2.9
import QtQuick.Controls.Imagine 2.3
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtLocation 5.6
import QtPositioning 5.6

Item {
    id: mainItem
    signal detectClicked()
    signal searchClicked()
    Behavior on implicitHeight {
        NumberAnimation { duration: 200; }
    }

    Rectangle {
        id: mainBorder
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        anchors.fill: parent
        color: "#ffffff"
        border.width: 1
        border.color: "#dfdfdf"
        radius: 15
    }

    ColumnLayout {
        width: parent.width
        Layout.fillWidth: true
        spacing: 10

        Item { height: 20; }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            width: parent.width
            Layout.fillWidth: true

            Item { width: 30; }

            Image {
                width: 185
                sourceSize.width: 185
                source: "qrc:/resources/logo.png"
            }

            Item { }
        }

        Text {
            font.family: fontSystem.getContentFontBold.name
            font.pixelSize: fontSystem.h1
            font.bold: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: qsTr("IP - Info ")
            color: "#171c26"
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter
            width: parent.width
            Layout.fillWidth: true
            spacing: 20

            Item { Layout.fillWidth: true; }

            PrefsButton {
                id: shortButton
                implicitWidth: parent.width / 1.2
                implicitHeight: 38
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.family: fontSystem.getContentFont.name
                font.pixelSize: fontSystem.h4
                text: "Detect"

                onClicked: {
                   detectClicked()
                }
            }

            PrefsButton {
                id: detectButton
                implicitWidth: parent.width / 1.2
                implicitHeight: 38
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.family: fontSystem.getContentFont.name
                font.pixelSize: fontSystem.h4
                text: "Search"

                onClicked: {
                    searchClicked()
                }
            }

            Item { Layout.fillWidth: true; }
        }

        Item {}

    }
    Item {}
}
