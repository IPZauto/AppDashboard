import QtQuick
import QtQuick.Controls
import QtMultimedia

Rectangle {
    id: root
    width: 1920
    height: 1080
    color: "#000000"
    property int currentSongId: 0
    property double volume: 0.1

    //signal songSwitched(int song)

    gradient: Gradient {
        orientation: Gradient.Horizontal
            GradientStop { position: -0.05; color: "#277070" }
            GradientStop { position: 0.25; color: "#000000" }
            GradientStop { position: 0.75; color: "#000000" }
            GradientStop { position: 1.05; color: "#277070" }
    }

    // TopBar {
    // }

    OnOffButton {
        id: onOffButton
        y: 195
        width: 80
        height: 80
        // anchors.right: right_arrow.left
        // anchors.rightMargin: width
        anchors.bottom: right_arrow.top
        anchors.bottomMargin: root.height/4 - right_arrow.height/2
        anchors.horizontalCenter: parent.horizontalCenter

        Connections {
            target: onOffButton
            onClicked: {
                !playMusic.playing ? playCurrentSong() : playMusic.pause();
            }
        }

    }

    MediaPlayer {
        id: playMusic
        audioOutput: AudioOutput {id: audioOutput}
        source: "sounds/Harry Styles - Daylight.mp3"
    }

    ListModel {
        id: playlistModel
        ListElement {url: "sounds/Harry Styles - Daylight.mp3"}
        ListElement {url: "sounds/Harry Styles - Satellite.mp3"}
        ListElement {url: "sounds/Hozier - Too Sweet.mp3"}
    }

    function playCurrentSong(){
        if(root.currentSongId>=0 && root.currentSongId<playlistModel.count){
            playMusic.source = Qt.resolvedUrl(playlistModel.get(root.currentSongId).url);
        }else{
            root.currentSongId = 0;
        }
        playMusic.play();
        musicText.text = playlistModel.get(root.currentSongId).url.slice((playlistModel.get(root.currentSongId).url).lastIndexOf("/")+1);
    }

    function playNextSong(){
        playMusic.stop();
        root.currentSongId = root.currentSongId >= playlistModel.count-1 ? 0 : root.currentSongId+1;
        playCurrentSong();
    }

    function playPreviousSong(){
        playMusic.stop();
        root.currentSongId = root.currentSongId == 0 ? playlistModel.count - 1 : root.currentSongId-1;
        playCurrentSong();
    }

    CustomText {
        id: musicText
        text: "MUSIC"
        font.pointSize: 30
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Image {
        id: left_arrow
        source: Qt.resolvedUrl("images/left_arrow.png")
        width: 80
        height: 300
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: -(5*(root.width/2)/6 - width)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 0
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: playPreviousSong();
        }
    }

    Image {
        id: right_arrow
        source: Qt.resolvedUrl("images/right_arrow.png")
        width: 80
        height: 300
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: 5*(root.width/2)/6 - width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 0
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: playNextSong();
        }
    }

    Slider {
        id: slider
        width: 1*root.width/2
        height: 0.1*root.height
        value: 0.1
        anchors.top: musicText.bottom
        anchors.topMargin: height
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        from: 0
        to: 1
        stepSize: 0.1
        live: true
        snapMode: Slider.SnapOnRelease

        Connections {
            target: slider
            onMoved: {
                root.volume = slider.value;
                audioOutput.volume = root.volume;
            }
        }

    }


    // CustomMenuBar {
    //     id: menuBar
    //     anchors.bottom: parent.bottom
    //     anchors.bottomMargin: 0
    // }
}
