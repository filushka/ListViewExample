import QtQuick 2.0

import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.6

Item {
    width: 600
    height: 400
    anchors { leftMargin: 10; topMargin: 10; rightMargin: 10; bottomMargin: 10 }


    MainScreen {
        id: saveTemperatureData
        width: 640
        height: 480

        property int currentIndex: 0
        property string title: qsTr("")

        property string labelSelectOne: "select"
        property string labelSelectAll: "select all"

        Properties{
            id: properties
        }

        buttonLabels: [qsTr(""), qsTr(""), labelSelectAll, labelSelectOne ]
        //buttonActions: ["TemperatureScreen", "select", "select", "select"]


        states: [
            State {
                name:  "selectAllDeselect" // toggledCurrent
                PropertyChanges { target: saveTemperatureData; labelSelectOne: qsTr("deselect"); labelSelectAll: qsTr("select all") ; }
            },
            State {
                name: "selectAllSelect" // untoggledCurrent
                PropertyChanges { target: saveTemperatureData; labelSelectOne:  qsTr("select"); labelSelectAll: qsTr("select all") ;  }
            },
            State {
                name: "selectNoneDeselect" // toggledCurrent
                PropertyChanges { target: saveTemperatureData; labelSelectOne: qsTr("deselect"); labelSelectAll:  qsTr("select none") }
            }
        ]

        function  allToggled() {
            var res = true;
            for( var i = 0; i < saveTemperatureDataLV.model.count; i++)
                res = (res &saveTemperatureDataLV.model.get(i).toggled)
            return res;
        }

        onButtonClickedScreen: {
            switch(buttonNumber) {
            case 0:
                break;
            case 1:
                break;
            case 2:
                if( saveTemperatureData.state === 'selectAllDeselect' ){
                    for( var i = 0; i < saveTemperatureDataLV.model.count; i++)
                        saveTemperatureDataLV.model.set( i, {"toggled": true})
                    saveTemperatureData.state = 'selectNoneDeselect'
                }
                else if( saveTemperatureData.state === 'selectAllSelect' ){
                    for( var k = 0; k < saveTemperatureDataLV.model.count; k++)
                        saveTemperatureDataLV.model.set( k, {"toggled": true })
                    saveTemperatureData.state = 'selectNoneDeselect'
                }
                else if( saveTemperatureData.state === 'selectNoneDeselect' ){
                    for( var j = 0; j < saveTemperatureDataLV.model.count; j++)
                        saveTemperatureDataLV.model.set( j, {"toggled": false })
                    saveTemperatureData.state = 'selectAllSelect'
                 }
                break;
            case 3:
                saveTemperatureDataLV.model.set( currentIndex, {"toggled": !saveTemperatureDataLV.model.get(currentIndex).toggled }) // to be changed
                break;
            }

            console.log( "Button " + buttonNumber)
        }

        onSelected: {
            console.log( "Meow")
            switch(key) {
            case Qt.Key_0:
                //goToTemperatureScreen()
                console.log( "0Not implemented yet")
                break;
            case Qt.Key_1:
                console.log( "1Not implemented yet")
                break;
            case Qt.Key_2:
                console.log( "2Not implemented yet")
                break;
            case Qt.Key_3:
                console.log( "Not implemented yet")
                break;
            case Qt.Key_Up:
                if(currentIndex > 0 )
                    --currentIndex;
                console.log( "UP")
                break;
            case Qt.Key_Down:
                if(currentIndex < saveTemperatureDataLV.model.count-1 )
                    ++currentIndex;
                scrollTimer.goUp = (key === Qt.Key_Up)
                scrollTimer.interval = scrollTimer.normalInterval
                scrollTimer.running = true
                break;
            }
        }


        Keys.onReleased: {

            console.log("key: " + event.key )

            if( event.key === Qt.Key_Up || event.key === Qt.Key_Down)
                scrollTimer.running = false
        }


        onCurrentIndexChanged: {
            console.log("Current index changed: " + currentIndex)
            saveTemperatureDataLV.positionViewAtIndex(currentIndex, ListView.Contain)
        }


        Timer {
            id: scrollTimer
            property bool goUp
            property int normalInterval: 200 // 5 per second
            property int fastInterval: 100 // 10 per second
            repeat: true
            triggeredOnStart: true
            onTriggered: {
                if(goUp && currentIndex > 0)
                    currentIndex--;
                else if(!goUp && currentIndex < saveTemperatureDataLV.count - 1)
                    currentIndex++;
                else
                    running = false
            }
        }

        Timer {
            id: scrollTimerAccelerator
            interval: 2000
            running: scrollTimer.running
            onTriggered: scrollTimer.interval = scrollTimer.fastInterval
        }

        Rectangle {
            id: programRect
            anchors { left: parent.left; leftMargin: 20; top: parent.top; topMargin: properties.titleMargin; bottom: parent.bottom; bottomMargin: properties.buttonMargin }
            width: 420
            color: properties.boxBG

            ListModel {
                id: sampleModel

                ListElement { toggled: true; data: "2011-0713-T19:09:56GGGGGGGGG"; starttime: "2018-0713-T19:09"; operatorid: "George Hegel"; target: 320; minimum: 200; maximum: 500; }
                ListElement { toggled: false; data: "2012-0713-T19:09:56vvvvvvvvvvvvvvvvv"; starttime: "2018-0813-T19:09"; operatorid: "Chris Water"; target: 321; minimum: 201; maximum: 501;}
                ListElement { toggled: false; data: "2013-0713-T19:09:56GGsssssssssssss"; starttime: "2018-0913-T19:09"; operatorid: "Alex"; target: 322; minimum: 202; maximum: 502;}
                ListElement { toggled: false; data: "2014-0713-T19:09:56GGeeeeee"; starttime: "2018-1013-T19:09"; operatorid: "Tony"; target: 323; minimum: 203; maximum: 503;}
                ListElement { toggled: false; data: "2015-0713-T19:09:56GGGGG66666666"; starttime: "2018-1123-T19:09"; operatorid: "George Hegel"; target: 324; minimum: 204; maximum: 504; }
                ListElement { toggled: false; data: "2016-0713-T19:09:56GGGGbbbbbbbbb"; starttime: "2018-1231-T19:09"; operatorid: "George Hegel"; target: 325; minimum: 205; maximum: 505;}
                ListElement { toggled: false; data: "2017-0713-T19:09:56G11111111"; starttime: "2018-0101-T19:09"; operatorid: "George Hegel"; target: 326; minimum: 206; maximum: 506;}
                ListElement { toggled: false; data: "2018-0713-T19:09:56GGGGGGG3333"; starttime: "2018-0227-T19:09"; operatorid: "George Hegel"; target: 327; minimum: 207; maximum: 507;}
                ListElement { toggled: false; data: "2019-0713-T19:09:5633333333444444444"; starttime: "2018-0314-T19:09"; operatorid: "George Hegel"; target: 328; minimum: 208; maximum: 508; }
                ListElement { toggled: false; data: "2010-0713-T19:09:56G88888888888"; starttime: "2018-0419-T19:09"; operatorid: "George Hegel"; target: 329; minimum: 209; maximum: 509; }

                ListElement { toggled: false; data: "2011-0713-T19:09:56G11111111"; starttime: "2018-0101-T19:09"; operatorid: "George Hegel"; target: 326; minimum: 206; maximum: 506;}
                ListElement { toggled: false; data: "2012-0713-T19:09:56GGGGGGG3333"; starttime: "2018-0227-T19:09"; operatorid: "George Hegel"; target: 327; minimum: 207; maximum: 507;}
                ListElement { toggled: false; data: "2013-0713-T19:09:5633333333444444444"; starttime: "2018-0314-T19:09"; operatorid: "George Hegel"; target: 328; minimum: 208; maximum: 508; }
                ListElement { toggled: false; data: "2014-0713-T19:09:56G88888888888"; starttime: "2018-0419-T19:09"; operatorid: "George Hegel"; target: 329; minimum: 209; maximum: 509; }

            }


            ListView {
                id: saveTemperatureDataLV

                anchors.fill: parent;
                spacing: 2
                clip: true
                model: sampleModel
                delegate: Rectangle{
                    property bool isSelected: saveTemperatureData.currentIndex === index
                    width: scrollbar.visible ? 405 : 425
                    height: 38
                    color: isSelected ? properties.selectedBoxBG : properties.activeBG

                    Rectangle {
                        id: rectIcon
                        property bool isToggled: toggled
                        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 10;  }
                        width: 18;
                        height: 18
                        radius: 19
                        color: toggled ? "#59C824" : "transparent"
                        border { width: 1; color: properties.lightMode ? ( isSelected ? ( "#F7F7F7" ) : ("#173B65") ) : Properties.textColor }

                        onIsToggledChanged: {
                            saveTemperatureData.state = ( toggled ? ( saveTemperatureData.allToggled() ? 'selectNoneDeselect' : 'selectAllDeselect') : 'selectAllSelect' )
                        }
                    }

                    Text {
                        z: 2
                        anchors { verticalCenter: parent.verticalCenter; left: rectIcon.right; leftMargin: 20;  }
                        font { family: properties.fontFamily; pixelSize: 16; styleName: properties.fontNormal; letterSpacing: 1 }
                        color: isSelected ? properties.activeBG : properties.textColor
                        verticalAlignment: Text.AlignVCenter
                        text: model.data
                    }

                    onIsSelectedChanged: {
                        if(isSelected) {
                            saveTemperatureData.state = ( toggled ? ( saveTemperatureData.allToggled() ? 'selectNoneDeselect' : 'selectAllDeselect') : 'selectAllSelect' )

                            detailsModel.clear()
                            //var tempUnit = "°" + (tcdata.fahrenheitFlag ? qsTr("F") : qsTr("C"))
                            detailsModel.append({ "label": qsTr("Start Time"), "value": starttime })
                            detailsModel.append({ "label": qsTr("Technician"), "value": operatorid })
                            //detailsModel.append({ "label": qsTr("Target Temperature"), "value": target + tempUnit })
                            //detailsModel.append({ "label": qsTr("Max Temperature"), "value": maximum + tempUnit })
                            //detailsModel.append({ "label": qsTr("Min Temperature"), "value": minimum + tempUnit })
                         }
                    }
                }
            }
            Rectangle {
                id: scrollbar
                anchors.right: parent.right
                width: 13
                visible: saveTemperatureDataLV.count > 10 // saveTemperatureDataLV can only hold 8 whole delegates
                height: Math.max(parent.height / saveTemperatureDataLV.contentHeight * parent.height - 2, 20)
                y: saveTemperatureDataLV.contentY / saveTemperatureDataLV.contentHeight * parent.height
                color: properties.lightMode ? "#D5D5D5" :"#646464"
            }
        }

        // Right
        Text {
            id: textDetails
            anchors { left: programRect.right; leftMargin: 11; top: parent.top; topMargin: properties.titleMargin + 10 }
            font { family: properties.fontFamily; pixelSize: 14; letterSpacing: 1 }
            color: properties.textColor
            text: qsTr("Details")
        }

        Rectangle{
            id: detailsRect
            anchors { left: programRect.right; top: parent.top; right: parent.right; leftMargin: 11;  topMargin: properties.titleMargin + 27; rightMargin: 20; }
            height: 305
            color: properties.boxBG

            ListModel { id: detailsModel }
            ListView {
                id: detailsView
                anchors.fill: parent
                model: detailsModel
                spacing: 50 - (count * 5) // 7 == 15; 6 == 20; 5 == 25.
                delegate: Item {
                    width: detailsRect.width
                    height: 25
                    Text {
                        anchors { left: parent.left; leftMargin: 10; top: parent.top; topMargin: 7 }
                        font { family: properties.fontFamily; pixelSize: 11 }
                        color: properties.textColor
                        text: label + ":"
                    }
                    Text {
                        anchors { left: parent.left; leftMargin: 10; top: parent.top; topMargin: 20 }
                        font { family: properties.fontFamily; pixelSize: 14; styleName: properties.fontNormal }
                        color: properties.textColor
                        text: value
                    }
                }
            }
        }
    }

}

