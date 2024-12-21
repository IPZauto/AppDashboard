

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import AppDashboardProject
import QtQuick.Studio.DesignEffects

Rectangle {
    id: appRoot
    width: Constants.width
    height: Constants.height
    color: "#000000"

    property int selectedView: 0

    TopBar {
        id: topBar
        anchors.top: parent.top
        anchors.topMargin: 0
        z: 2
    }

    Item {
        id: mainScreen
        width: appRoot.width
        height: appRoot.height
        anchors.top: parent.top
        anchors.topMargin: 0

        NavScreen {
            height: mainScreen.height
            width: mainScreen.width
            visible: appRoot.selectedView === 0
            enabled: appRoot.selectedView === 0
        }

        GlobeScreen {
            height: mainScreen.height
            width: mainScreen.width
            visible: appRoot.selectedView === 1
            enabled: appRoot.selectedView === 1
        }

        MusicScreen {
            height: mainScreen.height
            width: mainScreen.width
            visible: appRoot.selectedView === 2
            enabled: appRoot.selectedView === 2
        }

        ReverseScreen {
            height: mainScreen.height
            width: mainScreen.width
            visible: appRoot.selectedView === 3
            enabled: appRoot.selectedView === 3
        }
    }

    CustomMenuBar {
        id: menu
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        width: appRoot.width
        z: 2

        Connections {
            target: menu
            function onViewSwitched(view: int) {
                appRoot.selectedView = view
                topBar.title = view
                        === 0 ? "Nav" : (view === 1 ? "Globe" : (view === 2 ? "Music" : "Reverse"))
            }
        }
    }
}
