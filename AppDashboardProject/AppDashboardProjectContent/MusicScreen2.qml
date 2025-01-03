import QtQuick
import QtQuick.Controls
import QtMultimedia

Rectangle {
    id: root
    width: 1920
    height: 1080
    color: "#000000"
    property int currentSongId: 0
    //property bool songChanged: false
    property double volume: 0.1
    property bool muted: false

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
        width: 80
        height: 80
        anchors.top: progressBar.bottom
        // anchors.right: right_arrow.left
        // anchors.rightMargin: width
        anchors.topMargin: 100
        anchors.horizontalCenter: parent.horizontalCenter

        Connections {
            target: onOffButton
            onClicked: {
                !musicPlayer.playing ? playCurrentSong() : musicPlayer.pause();
            }
        }

    }

    MediaPlayer {
        id: musicPlayer
        audioOutput: AudioOutput {id: audioOutput}
    }

    ListModel {
        id: playlistModel
        ListElement {url: "sounds/Harry Styles - Daylight.mp3"}
        ListElement {url: "sounds/Harry Styles - Satellite.mp3"}
        ListElement {url: "sounds/Hozier - Too Sweet.mp3"}
    }

    function playCurrentSong(){
        if(root.currentSongId>=0 && root.currentSongId<playlistModel.count){
            musicPlayer.source = Qt.resolvedUrl(playlistModel.get(root.currentSongId).url);
        }else{
            root.currentSongId = 0;
        }
        musicPlayer.play();
        musicText.text = playlistModel.get(root.currentSongId).url.slice((playlistModel.get(root.currentSongId).url).lastIndexOf("/")+1);
    }

    function playNextSong(){
        musicPlayer.stop();
        //root.songChanged = true;
        root.currentSongId = root.currentSongId >= playlistModel.count-1 ? 0 : root.currentSongId+1;
        playCurrentSong();
    }

    function playPreviousSong(){
        musicPlayer.stop();
        //root.songChanged = true;
        root.currentSongId = root.currentSongId == 0 ? playlistModel.count - 1 : root.currentSongId-1;
        playCurrentSong();
    }

    // function manageSongEnd(){
    //     if(!root.songChanged){
    //         playNextSong();
    //     }
    //     root.songChanged = false;
    // }

    function checkMuted() {
        root.muted = !root.muted;
    }

    function manageSound(){
        checkMuted();
        if(root.muted){
            sound_icon.source = "images/sound_icon_internet33.png";
        }else{
            sound_icon.source = "images/sound_icon_internet31.png";
        }
        musicPlayer.audioOutput.muted = root.muted;
    }


    CustomText {
        id: musicText
        text: "MUSIC"
        font.pointSize: 30
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -100
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Image {
        id: left_arrow
        source: Qt.resolvedUrl("images/arrow_back_icon.png")
        width: 80
        height: 80
        anchors.verticalCenter: onOffButton.verticalCenter
        anchors.right: onOffButton.left
        anchors.rightMargin: 100
        fillMode: Image.PreserveAspectFit

        MouseArea {
            id: left_arrow_area
            anchors.fill: parent
            onClicked: playPreviousSong();
        }
    }

    Image {
        id: right_arrow
        source: Qt.resolvedUrl("images/arrow_forward_icon.png")
        width: 80
        height: 80
        anchors.verticalCenter: onOffButton.verticalCenter
        anchors.left: onOffButton.right
        anchors.leftMargin: 100
        fillMode: Image.PreserveAspectFit

        MouseArea {
            id: right_arrow_area
            anchors.fill: parent
            onClicked: playNextSong();
        }
    }

    Item {
        id: _item
        width: 80
        height: 1*root.width/3 + 80
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.verticalCenterOffset: 20

        Slider {
            id: slider
            height: 1*root.width/3
            width: 0.1*root.height
            value: 0.9
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            rotation: 180
            from: 0
            to: 1
            stepSize: 0.1
            live: true
            orientation: Qt.Vertical
            snapMode: Slider.SnapOnRelease

            Connections {
                target: slider
                onMoved: {
                    root.volume = 1 - slider.value;
                    audioOutput.volume = root.volume;
                }
            }
        }

        Image {
            id: sound_icon
            width: 50
            anchors.top: parent.top
            anchors.bottom: slider.top
            anchors.topMargin: 0
            anchors.bottomMargin: 10
            source: "images/sound_icon_internet31.png"
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit

            MouseArea {
                anchors.fill: parent
                onClicked: manageSound();
            }
        }
    }

    ProgressBar {
        id: progressBar
        width: 2*root.width/3
        height: 10
        value: 0.0
        y: 2*(root.height)/3 - 5*height
        anchors.horizontalCenter: parent.horizontalCenter
        from: 0
        to: 0
    }

    Connections {
        target: musicPlayer
        onActiveTracksChanged: musicText.text = "change"
    }


    // CustomMenuBar {
    //     id: menuBar
    //     anchors.bottom: parent.bottom
    //     anchors.bottomMargin: 0
    // }
}
