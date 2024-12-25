import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    width: 1920
    height: 1080
    color: "#000000"

    TopBar {
    }

    OnOffButton {
        width: 350
        height: 350
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }


    CustomMenuBar {
        id: menuBar
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
    }
}
