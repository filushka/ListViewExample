import QtQuick 2.0

Rectangle {
    id: root
    property alias backgroundColor: root.color
    property alias buttonWidth: root.width
    property alias buttonHeight: root.height
    property string title
    property int buttonNumber

    signal buttonClicked(int number);

    Properties{
        id: properties
    }

    Text {
        anchors { horizontalCenter: parent.horizontalCenter; verticalCenter: parent.verticalCenter }
        text: title
        font.family: properties.fontFamily
        font.pointSize: properties.fontSizeButton
        color: properties.textColor
    }

    color: "gray";
    border {width: 1; color: "black" }

    MouseArea{
        anchors{ fill: parent }
        onClicked: {
           root.buttonClicked(buttonNumber);
        }
    }
}

