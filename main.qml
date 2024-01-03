// Copyright (C) 2024 Adesh Singh

import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls.Imagine 2.3
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtLocation 5.6
import QtPositioning 5.6

ApplicationWindow {
    id: appRoot

    width: 800
    height: 900
    minimumHeight: 900
    minimumWidth: 800
    maximumWidth: 800
    maximumHeight: 900

    visible: true
    title: qsTr("IPInfo")
    color: "#f2f2f2"

    QtObject {
        id: appObject
        readonly property string apiUrl : "https://ipinfo.io/json?"
        readonly property string apiKey : "";
        readonly property string method : "GET";

        property string ip: "0.0.0.0"
        property string hostname: "localhost"
        property string city: "Unknown"
        property string region: "Unknown"
        property string country: "Unknown"
        //property string loc: "Unknown"
        property string postal: "Unknown"
        property string timezone: "Unknown"
        property string loc: "28.6092,76.9798"

    }
    FontSystem { id: fontSystem; }

    //! Remove extra double quote for some json outputs.
    function stringFixer(variable)
    {
        return variable.replace(/['"]+/g, '\n');
    }

    //https://ipinfo.io/103.252.216.59?token=07d61fbab4b005

    function dataRequest(type,ip)
    {
        var req = new XMLHttpRequest();
        if(type === "search"){
            var urlIp = "https://ipinfo.io/" + ip + "?"
            req.open(appObject.method, urlIp + "token=07d61fbab4b005");
        }else{
            req.open(appObject.method, appObject.apiUrl + "token=07d61fbab4b005");
        }
        req.onreadystatechange = function() {
            if (req.readyState === XMLHttpRequest.DONE) {
                let result = JSON.parse(req.responseText);
                console.log(JSON.stringify(req.responseText))
                //Data
                appObject.ip = result.ip ? result.ip : "0.0.0.0"
                appObject.hostname = result.hostname ? result.hostname : "localhost"
                appObject.city = result.city ? result.city : "Unknown"
                appObject.region = result.region ? result.region : "Unknown"
                appObject.country = result.country ? result.country : "Unknown"
                appObject.loc = result.loc ? result.loc : "28.6092,76.9798"
                appObject.postal = result.postal ? result.postal : "Unknown"
                appObject.timezone = result.timezone ? result.timezone : "Unknown"
            }
            busyIndicator.running = false;
        }
        req.onerror = function(){
            console.log("Error!")
        }
        req.send()
    }

    Pane {
        anchors.fill: parent
        background: appRoot.background
        topPadding: 0

        ColumnLayout {
            width: parent.width
            Layout.fillWidth: true
            anchors.centerIn: parent

            spacing: 16

            Text {
                font.family: fontSystem.getContentFontBold.name
                font.pixelSize: fontSystem.h1
                font.bold: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                text: qsTr("The trusted source for IP address data")
                color: "#171c26"
            }
            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: fontSystem.h4
                font.bold: false
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                text: qsTr("Accurate IP address data that keeps pace with secure, specific, and forward-looking use cases.")
                color: "#171c26"
            }

            StackView{
                id:pageStack
                width: 430
                implicitHeight: 650
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Behavior on implicitHeight {
                    NumberAnimation { duration: 200; }
                }
                initialItem: homePage
            }

            Component{
                id:ipInfoPage
                IPInfoPage{
                    objectName: "ipinfopage"
                    onDetectIp: {
                        busyIndicator.running = true;
                        dataRequest();
                    }
                }
            }

            Component{
                id:homePage
                HomePage{
                    objectName: "homepage"
                    onDetectClicked: {
                        pageStack.replace(ipInfoPage)
                    }

                    onSearchClicked: {
                        pageStack.replace(searchIpInfoPage)
                    }
                }
            }

            Component{
                id:searchIpInfoPage
                SearchIPAddressPage{
                    objectName: "searchippage"
                    onSearchIp: {
                        busyIndicator.running = true;
                        dataRequest("search",ipAddress);
                    }
                }
            }

            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: 15
                font.bold: false
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                onLinkActivated: Qt.openUrlExternally(link)
                text: "Made by <strong> Indian </strong> with love for freedom world."
                color: "#85878d"
            }

            Image{
                Layout.alignment: Qt.AlignHCenter
                sourceSize: Qt.size(36,24)
                source: "qrc:/resources/india.svg"
            }
        }

        Rectangle {
            visible: pageStack.currentItem.objectName !== "homepage"
            width: 48
            height: 48
            radius: width
            color: "#00000000"

            Image{
                opacity: 0.5
                anchors.centerIn: parent
                sourceSize: Qt.size(32,32)
                source: "qrc:/resources/back-square.svg"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(pageStack.currentItem.objectName !== "homepage"){
                        pageStack.replace(homePage)
                    }
                }
            }

            anchors.bottom: parent.bottom
            anchors.right: parent.right
        }

        BusyIndicator {
            id: busyIndicator
            width: 48
            height: 48
            running: false
            anchors.bottom: parent.bottom
            contentItem: Item {
                implicitWidth: 16
                implicitHeight: 16

                Item {
                    id: itemProgress
                    x: parent.width / 2 - 16
                    y: parent.height / 2 - 16
                    width: 32
                    height: 32
                    opacity: busyIndicator.running ? 1 : 0

                    Behavior on opacity {
                        OpacityAnimator {
                            duration: 250
                        }
                    }

                    RotationAnimator {
                        target: itemProgress
                        running: busyIndicator.visible && busyIndicator.running
                        from: 0
                        to: 360
                        loops: Animation.Infinite
                        duration: 1250
                    }

                    Repeater {
                        id: repeater
                        model: 3

                        Rectangle {
                            x: itemProgress.width / 2 - width / 2
                            y: itemProgress.height / 2 - height / 2
                            implicitWidth: 5
                            implicitHeight: 5
                            radius: 2.5
                            color: "#171c26"
                            transform: [
                                Translate {
                                    y: -Math.min(itemProgress.width, itemProgress.height) * 0.5 + 7
                                },
                                Rotation {
                                    angle: index / repeater.count * 360
                                    origin.x: 2.5
                                    origin.y: 2.5
                                }
                            ]
                        }
                    }
                }
            }
        }
    }
}
