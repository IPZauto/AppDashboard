import QtQuick
import QtQuick.Controls
import QtQuick.Studio.DesignEffects


Item {
    id: root
    width: 1920
    height: menubar.height + line.height

    signal viewSwitched(int view)

    Rectangle {
        id: line
        color: "#ffffff"
        anchors.horizontalCenter: parent.horizontalCenter
        width: root.width - 300
        height: 2

    }

    Item {
        id: menubar
        width: 1920
        height: 150
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0


        Row {
            width: menubar.width
            height: menubar.height
            layoutDirection: none.none
            leftPadding: 300
            rightPadding: 300
            spacing: (menubar.width - 400 - 600) / 3

            MenuButton {
                id: navButton
                anchors.verticalCenter: parent.verticalCenter
                background: Image {
                    source: Qt.resolvedUrl("images/icon_nav.png")
                }

                Connections {
                    target: navButton
                    onClicked: root.viewSwitched(0)
                }
            }

            MenuButton {
                id: globeButton
                anchors.verticalCenter: parent.verticalCenter
                background: Image {
                    id: image
                    source: Qt.resolvedUrl("images/icon_globe1.png")
                }

                Connections {
                    target: globeButton
                    onClicked: root.viewSwitched(1)
                }
            }

            MenuButton {
                id: musicButton
                anchors.verticalCenter: parent.verticalCenter
                background: Image {
                    source: Qt.resolvedUrl("images/icon_music.png")
                }

                Connections {
                    target: musicButton
                    onClicked: root.viewSwitched(2)
                }
            }

            MenuButton {
                id: reverseButton
                anchors.verticalCenter: parent.verticalCenter
                background: Image {
                    source: Qt.resolvedUrl("images/icon_reverse2.png")
                }

                Connections {
                    target: reverseButton
                    onClicked: root.viewSwitched(3)
                }
            }
        }
    }
}

