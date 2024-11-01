!function (o) {
    var w = window;
    w.SessionRewindConfig = o;
    var f = document.createElement("script");
    f.async = 1, f.crossOrigin = "anonymous",
      f.src = "https://rec.sessionrewind.com/srloader.js";
    var g = document.getElementsByTagName("head")[0];
    g.insertBefore(f, g.firstChild);
  }({
    apiKey: 'yD1hZfh8V93ZhaCU1ZeOL5brV2O4sPs0218oONo5',
    // Start recording immediately upon page load.
    // If not set (or set to false) recording will need to be started later via window.sessionRewind.startSession()
    startRecording: true,
    // OPTIONAL: Create a new session upon page load, even if one has already started.
    // createNewSession: false,
    // OPTIONAL: Custom session metadata
    sessionInfo: {
      customFieldA: "canvas" // Example custom field
    },
    // OPTIONAL: Custom user metadata
    // userInfo: {
    //   userId: hello@sessionrewind.com, // This field is required when using userInfo
    //  userName: John Doe, // Optional, user name
    // },
    // OPTIONAL: onLoad Callback
    // onLoad: () => {
    //   // Callback executed when the script is loaded. It can be used to
    //   // do things like:
    //   window.sessionRewind.getSessionUrl((url) => { foo... }
    // },
  });