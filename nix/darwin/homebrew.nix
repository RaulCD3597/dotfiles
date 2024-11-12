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
	"sketchybar"
    ];
    casks = [
	"docker"
	"google-chrome"
	"font-hack-nerd-font"
	"font-sf-pro"
	"sf-symbols"
	"nikitabobko/tap/aerospace"
    ];
    masApps = {
	"Xcode" = 497799835;
    };
}
