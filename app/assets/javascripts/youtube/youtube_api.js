function onYouTubePlayerAPIReady() {
    console.log("onYouTubePlayerAPIReady called");

    ytplayer = new YT.Player('ytplayer', {
        width: '640px',
        height: '480px',
        playerVars: { 'autoplay': 0, 'controls': 0, 'wmode': 'opaque',
            //'playlist': vids.join(),
            'origin': 'http://localhost:3000/',
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
    console.log("Player is ready");

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
    console.log("player state change");
    // var newState = event.data;
    // updateHTML("playerState", newState);
    // console.log("newState: " + newState);
    // if (newState == 0 || newState == 2 || newState == 3 || newState == 5) {
    //   clearInterval(t);
    //   console.log("clearInterval ran (state change)");
    // } else if (newState == 1) {
    //   t = setInterval(stopAtTime, 1000, interval);
    // }
    // if (newState == 0 || newState == 2 || newState == 3 || newState == 5) {
    //   if (t) {
    //     clearTimeout(t);
    //     // console.log("timeout cleared")
    //   }
    // } else if (newState == 1) {
    //   t = setTimeout(showQuiz, gon.interval * 1000)
    // }
}

// This function is called when an error is thrown by the player
function onPlayerError(errorCode) {
    alert("An error occured of type:" + errorCode);
}
