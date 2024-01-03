// Copyright (C) 2024 Adesh Singh

import QtQuick 2.9
import QtQuick.Controls.Imagine 2.3
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtLocation 5.6
import QtPositioning 5.6

Item {
    id: mainItem
    signal detectIp()
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
            width: parent.width
            Layout.fillWidth: true

            Item { width: 30; }

            Image {
                width: 85
                sourceSize.width: 85
                source: "qrc:/resources/logo.png"
            }

            Item { }

            Rectangle {
                width: parent.width - 152
                height: 54
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                color: "#f1f1f1"
                radius: 8
                ColumnLayout {
                    anchors.fill: parent
                    Item { width: 10; }
                    RowLayout {
                        width: parent.width
                        Layout.fillWidth: true
                        spacing: 0
                        Item { width: 8; }
                        Text {
                            font.family: fontSystem.getContentFont.name
                            font.pixelSize: 18
                            color: "#999"
                            text: qsTr("Current IP")
                        }
                        Item { width: 10; }

                        Text {
                            font.family: fontSystem.getContentFont.name
                            font.pixelSize: 20
                            font.letterSpacing: 1
                            color: "#777"
                            text: qsTr(appObject.ip)
                        }

                        Item { Layout.fillWidth: true; }
                    }
                    Item { width: 10; }

                }
            }


        }

        Pane{
            Layout.alignment: Qt.AlignHCenter
            width: parent.width * 0.9
            Layout.preferredWidth: parent.width * 0.9
            Layout.preferredHeight: 150
            background: Rectangle{
                anchors.fill: parent
                border.width: 5
                radius: 20
                color:  "#ffffff"
                border.color: "#dfdfdf"
            }
            Plugin {
                id: mapPlugin
                name: "osm" // "mapboxgl", "esri", ...
            }

            Map {
                anchors.fill: parent
                plugin: mapPlugin
                center: QtPositioning.coordinate(latitude(),longitude()) // Oslo 28.6092,76.9798
                zoomLevel: 8
                copyrightsVisible: false
                function latitude(){
                    var coordinatesArray = appObject.loc.split(',')
                    return parseFloat(coordinatesArray[0])
                }

                function longitude(){
                    var coordinatesArray = appObject.loc.split(',')
                    return parseFloat(coordinatesArray[1])
                }
            }
        }

        RowLayout {
            width: parent.width
            Layout.fillWidth: true
            spacing: 5
            Item { width: 30; }

            CircleIcon {}

            Item { width: 2; }

            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: 14
                text: qsTr("Hostname:")
            }
            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: 14
                color: "#007aff"
                text: qsTr(appObject.hostname)
            }

            Item { Layout.fillWidth: true; }
        }

        RowLayout {
            width: parent.width
            Layout.fillWidth: true
            spacing: 5
            Item { width: 30; }

            CircleIcon {}

            Item { width: 2; }

            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: 14
                text: qsTr("City:")
            }
            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: 14
                color: "#007aff"
                text: qsTr(appObject.city)
            }

            Item { Layout.fillWidth: true; }
        }

        RowLayout {
            width: parent.width
            Layout.fillWidth: true
            spacing: 5
            Item { width: 30; }

            CircleIcon {}

            Item { width: 2; }

            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: 14
                text: qsTr("Region:")
            }
            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: 14
                color: "#007aff"
                text: qsTr(appObject.region)
            }

            Item { Layout.fillWidth: true; }
        }

        RowLayout {
            width: parent.width
            Layout.fillWidth: true
            spacing: 5
            Item { width: 30; }

            CircleIcon {}

            Item { width: 2; }

            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: 14
                text: qsTr("Country:")
            }
            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: 14
                color: "#007aff"
                text: qsTr(appObject.country)
            }

            Item { Layout.fillWidth: true; }
        }

        RowLayout {
            width: parent.width
            Layout.fillWidth: true
            spacing: 5
            Item { width: 30; }

            CircleIcon {}

            Item { width: 2; }

            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: 14
                text: qsTr("Loc:")
            }
            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: 14
                color: "#007aff"
                text: qsTr(appObject.loc)
            }

            Item { Layout.fillWidth: true; }
        }

        RowLayout {
            width: parent.width
            Layout.fillWidth: true
            spacing: 5
            Item { width: 30; }

            CircleIcon {}

            Item { width: 2; }

            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: 14
                text: qsTr("Postal:")
            }
            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: 14
                color: "#007aff"
                text: qsTr(appObject.postal)
            }

            Item { Layout.fillWidth: true; }
        }


        RowLayout {
            width: parent.width
            Layout.fillWidth: true
            spacing: 5
            Item { width: 30; }

            CircleIcon {}

            Item { width: 2; }

            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: 14
                text: qsTr("Timezone:")
            }
            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: 14
                color: "#007aff"
                text: qsTr(appObject.timezone)
            }

            Item { Layout.fillWidth: true; }
        }

        Item {}

        PrefsButton {
            id: shortButton
            implicitWidth: parent.width / 1.2
            implicitHeight: 38
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.family: fontSystem.getContentFont.name
            font.pixelSize: fontSystem.h5
            text: "Detect"
            onClicked: {
                detectIp()
            }
        }
    }
    Item {}
}
