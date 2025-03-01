{ config, pkgs, ... }:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;
in
{
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "24.05";

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
 
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    home.username = "raulcamacho";
    home.homeDirectory = "/Users/raulcamacho";
    xdg.enable = true;

    xdg.configFile = {
      nvim.source = mkOutOfStoreSymlink "/Users/raulcamacho/.dotfiles/.config/nvim";
      starship.source = mkOutOfStoreSymlink "/Users/raulcamacho/.dotfiles/.config/starship";
      ghostty.source =  mkOutOfStoreSymlink "/Users/raulcamacho/.dotfiles/.config/ghostty";
    };
    home.file = {
      ".zshrc".source = mkOutOfStoreSymlink "/Users/raulcamacho/.dotfiles/.zshrc";
      ".tmux.conf".source = mkOutOfStoreSymlink "/Users/raulcamacho/.dotfiles/.tmux.conf";
    };
   
    programs.git = {
      enable = true;
      userName = "RaulCD3597";
      userEmail = "raulcd3597@gmail.com";
      ignores = [ ".DS_Store" ];
      extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
      };
    };
}
