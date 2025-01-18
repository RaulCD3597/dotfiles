{
    onActivation = {
	cleanup = "zap";
	autoUpdate = true;
	upgrade = true;
    };
    taps = [
	"FelixKratz/formulae"
	"nikitabobko/tap"
    ];
    brews = [
	"mas"
	"qmk/qmk/qmk"
    ];
    casks = [
	"docker"
	"google-chrome"
	"qmk-toolbox"
	"ghostty"
    ];
    masApps = {
	"Xcode" = 497799835;
    };
}
