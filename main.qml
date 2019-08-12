import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    //visibility: "FullScreen"
    //title: qsTr("Hello World")

    Temperature{
        anchors { left: parent.left; leftMargin: 0; top: parent.top; topMargin: 0;}

    }
}
