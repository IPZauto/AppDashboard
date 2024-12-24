import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    width: 1920
    height: 1080
    color: "#000000"

    gradient: Gradient {
        orientation: Gradient.Horizontal
            GradientStop { position: -0.05; color: "#277070" }
            GradientStop { position: 0.25; color: "#000000" }
            GradientStop { position: 0.75; color: "#000000" }
            GradientStop { position: 1.05; color: "#277070" }
    }

    // TopBar {
    // }

    CustomText {
        id: musicText
        text: "MUSIC"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Image {
        id: left_arrow
        source: Qt.resolvedUrl("images/left_arrow.png")
        width: 80
        height: 300
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: -750
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 0
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: musicText.text = "left arrow"
        }
    }

    Image {
        id: right_arrow
        source: Qt.resolvedUrl("images/right_arrow.png")
        width: 80
        height: 300
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: 750
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 0
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: musicText.text = "right arrow"
        }
    }

    // CustomMenuBar {
    //     id: menuBar
    //     anchors.bottom: parent.bottom
    //     anchors.bottomMargin: 0

    // }
}
