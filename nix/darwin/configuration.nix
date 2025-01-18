{ pkgs, config, ... }: {
    nixpkgs.config.allowUnfree = true;
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages = [
	pkgs.mkalias
	pkgs.neovim
	pkgs.tmux
	pkgs.go
	pkgs.starship
	pkgs.fzf
	pkgs.zoxide
	pkgs.nodejs_20
	pkgs.ripgrep
	pkgs.lazygit
	pkgs.cocoapods
	pkgs.discord
	pkgs.flutter
	pkgs.cargo
    ];

    homebrew = import ./homebrew.nix // { enable = true; };

    system.defaults = {
	dock = {
	    autohide = true;
	    persistent-apps = [
		"/Applications/Ghostty.app"
		"/Applications/Android Studio.app"
		"/Applications/Xcode.app"
		"/Applications/Safari.app"
	    ];
	};
	finder.FXPreferredViewStyle = "clmv";
	loginwindow.GuestEnabled = false;
	NSGlobalDomain = {
	    AppleICUForce24HourTime = true;
	    AppleInterfaceStyle = "Dark";
	    "com.apple.swipescrolldirection" = false;
	    _HIHideMenuBar = true;
	};
    };

    # Auto upgrade nix package and the daemon service.
    services = {
      nix-daemon.enable = true;
    };
    # nix.package = pkgs.nix;

    # Necessary for using flakes on this system.
    nix.settings.experimental-features = "nix-command flakes";

    # Create /etc/zshrc that loads the nix-darwin environment.
    programs.zsh.enable = true;  # default shell on catalina
    # programs.fish.enable = true;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 5;

    # The platform the configuration will be used on.
    nixpkgs.hostPlatform = "aarch64-darwin";

    users.users.raulcamacho = {
	name = "raulcamacho";
	home = "/Users/raulcamacho";
    };
}
