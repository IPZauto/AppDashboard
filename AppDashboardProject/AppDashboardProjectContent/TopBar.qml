import QtQuick
import QtQuick.Controls

Item {
    id: root
    width: 1920
    height: bar.height + line.height
    property int cmargin: 40
    property string title: "Nav"

    Item {
        id: bar
        width: root.width
        height: 100
        anchors.top: parent.top
        anchors.topMargin: 0

        CustomText {
            id: dateDay
            text: "Sob"
            anchors.left: parent.left
            anchors.leftMargin: cmargin
        }

        CustomText {
            id: dateTime
            text: "13:09"
            anchors.left: dateDay.right
            anchors.leftMargin: cmargin
        }

        CustomText {
            id: dataTitle
            text: title
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomText {
            id: dateLong
            text: "18 grudnia 2024"
            anchors.right: parent.right
            anchors.rightMargin: cmargin
        }
    }

    Rectangle {
        id: line
        color: "#ffffff"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        width: root.width - 300
        height: 2
    }

}


