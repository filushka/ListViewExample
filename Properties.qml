import QtQuick 2.0

import QtQuick 2.0

QtObject {
    id: propertiesObject

    property color selectedBoxBG: "#00aaFF"
    property color activeBG: "#00FFaa"
    property color textColor: "#FFFFFF"
    property bool lightMode: true
    property int titleMargin: 40
    property int buttonMargin: 40
    property color boxBG: "#008855"
// font.family: "Helvetica"; font.pointSize: 13; font.bold: true
    property string fontFamily: "Ubuntu"
    property int fontSizeButton: 16
    property int fontNormal: Font.DemiBold
}
