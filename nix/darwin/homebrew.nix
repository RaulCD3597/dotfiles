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
    "kubectl"
    "minikube"
  ];
  casks = [
    "docker"
    "google-chrome"
    "qmk-toolbox"
    "ghostty"
    "raycast"
    "anaconda"
  ];
  masApps = {
    "Xcode" = 497799835;
  };
}
