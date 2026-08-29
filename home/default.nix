{pkgs, ...}:

{
  home.username = "patryk";
  home.homeDirectory = "/home/patryk";
  
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
  
  home.packages = with pkgs; [
    # general
    tree
    unzip
    wget
    fd

    # usefull
    yazi

    # C/C++
    gcc
    gnumake
    gdb
    clang-tools
    gdb
    pkg-config

    lua-language-server

    # font
    iosevka
  ];

  programs.firefox.enable = true;
  programs.fastfetch.enable = true;
  programs.ripgrep.enable = true;
  programs.yazi.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };

  wayland.windowManager.hyprland.enable = true;

  xdg.configFile."hypr" = {
    source = ./hypr;
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
    settings = {
        confirm_os_window_close = 0;
    };
  };

  programs.lazygit.enable = true;
}
