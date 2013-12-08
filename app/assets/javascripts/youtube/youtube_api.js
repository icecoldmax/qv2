function onYouTubePlayerAPIReady() {
    ytplayer = new YT.Player('ytplayer', {
        width: '640px',
        height: '480px',
        playerVars: { 'autoplay': 0, 'controls': 0, 'wmode': 'opaque',
            //'playlist': vids.join(),
            'origin': 'https://quizvids.herokuapp.com/',
            'modestbranding': 1, 'showinfo': 0 
        },
        events: {
        'onReady': onPlayerReady,
        'onStateChange': onPlayerStateChange,
        'onError': onPlayerError
        }
    });
}

function onPlayerReady(event) {
    var loadPlaylist, loadVideo, muteVideo, nextVideo, pauseVideo, playVideo, prevVideo, stopVideo, unmuteVideo;

    playVideo = function() { if (ytplayer) { return ytplayer.playVideo(); } };
    pauseVideo = function() { if (ytplayer) { return ytplayer.pauseVideo(); } };
    stopVideo = function() { if (ytplayer) { return ytplayer.stopVideo(); } };
    muteVideo = function() { if (ytplayer) { return ytplayer.mute(); } };
    unmuteVideo = function() { if (ytplayer) { return ytplayer.unMute(); } };
    loadVideo = function(id) { if (ytplayer) { return ytplayer.loadVideoById(id); } };
    loadPlaylist = function(playlist) { if (ytplayer) { return ytplayer.loadPlaylist(playlist); } };
    nextVideo = function() { if (ytplayer) { return ytplayer.nextVideo(); } };
    prevVideo = function() { if (ytplayer) { return ytplayer.previousVideo(); } }; 

    window.playVideo = playVideo;
    window.pauseVideo = pauseVideo;
    window.stopVideo = stopVideo;
    window.muteVideo = muteVideo;
    window.unmuteVideo = unmuteVideo;
    window.loadVideo = loadVideo;
    window.loadPlaylist = loadPlaylist;
    window.nextVideo = nextVideo;
    window.prevVideo = prevVideo;

    $.holdReady(false);
}

function onPlayerStateChange(event) {
    var newState = event.data;
    quizModel.set({"state": newState});
}

function onPlayerError(errorCode) {
    alert("An error occured of type:" + errorCode);
}
