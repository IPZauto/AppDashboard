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

    CustomText {
        text: "MUSIC"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
