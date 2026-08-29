{pkgs, ...}:

{
  home.username = "patryk";
  home.homeDirectory = "/home/patryk";
  
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
  
  home.packages = with pkgs; [
    tree
    gcc
    gnumake
    pkg-config

    iosevka
  ];

  programs.firefox.enable = true;
  programs.fastfetch.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles#laptop";
      ll = "ls -lah";
    };
  };

  programs.git = {
    enable = true;

    settings.user.name = "xPatryk8";
    settings.user.email = "patrykzuk.pz@gmail.com";
  };

  programs.kitty = {
    enable = true;
    font.name = "iosevka";
  };

  programs.lazygit.enable = true;
}
