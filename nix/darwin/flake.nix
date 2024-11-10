{
  description = "Raul's Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager, mac-app-util }:
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."mbpro" = nix-darwin.lib.darwinSystem {
      modules = [
	./configuration.nix
        {
          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;
        }
	mac-app-util.darwinModules.default
	nix-homebrew.darwinModules.nix-homebrew
	{
          nix-homebrew = {
            enable = true;
            # Apple Silicon Only
            enableRosetta = true;
            # User owning the Homebrew prefix
            user = "raulcamacho";
          };
       }
       home-manager.darwinModules.home-manager
       {
	  home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
	  home-manager.verbose = true;
          home-manager.users.raulcamacho.imports = [ ./home.nix mac-app-util.homeManagerModules.default ];
       }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."mbpro".pkgs;
  };
}
