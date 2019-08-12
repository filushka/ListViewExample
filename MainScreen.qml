import QtQuick 2.0
import QtQuick 2.0

Rectangle {
    id: root
    focus: true

    property var buttonLabels: [qsTr("select"), qsTr("deselect"), qsTr("selectAll"), qsTr("") ]

    signal selected(int key)
    signal buttonClickedScreen(int buttonNumber )

    Properties{
        id: properties
    }

    Rectangle{
        id: topRect
        width: 640
        height: 40
        anchors{ topMargin: 0; rightMargin: 0}
        color: "black"

        Row {
            spacing: 0
            Button { title: buttonLabels[0]; backgroundColor: "gray"; buttonNumber: 0; buttonWidth: 160; buttonHeight: 40; onButtonClicked: root.buttonClickedScreen(0); }
            Button { title: buttonLabels[1]; backgroundColor: "gray"; buttonNumber: 1; buttonWidth: 160; buttonHeight: 40; onButtonClicked: root.buttonClickedScreen(1); }
            Button { title: buttonLabels[2]; backgroundColor: "gray"; buttonNumber: 2; buttonWidth: 160; buttonHeight: 40; onButtonClicked: root.buttonClickedScreen(2); }
            Button { title: buttonLabels[3]; backgroundColor: "gray"; buttonNumber: 3; buttonWidth: 160; buttonHeight: 40; onButtonClicked: root.buttonClickedScreen(3); }
        }

    }


    Keys.onReleased: {

       //console.log( "key: " + event.key)
       event.accepted = true;
       root.selected(event.key);
    }

    //width: 640 / 600
    //height: 480 / 400
    //anchors { leftMargin: 20; topMargin: 40; rightMargin: 20; bottomMargin: 40 }

    property int currentIndex: 0
    property string title: qsTr("")

    //property string labelSelectOne: ""
    //property string labelSelectAll: ""

    Rectangle{
        id: botomRect
        width: 640
        height: 40
        anchors{ leftMargin: 0; bottomMargin: 0; rightMargin: 0; bottom: parent.bottom }
        color: "green"

    }

}
