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
	"python-tk"
  "go"
    ];
    casks = [
	"docker"
	"google-chrome"
	"qmk-toolbox"
	"ghostty"
	"raycast"
    ];
    masApps = {
	"Xcode" = 497799835;
    };
}
