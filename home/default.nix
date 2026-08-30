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
    pkg-config

    lua-language-server

    # font
    iosevka
  ];

  stylix = {
    enable = true;

    base16Scheme = {
      base00 = "#1e1e2e";
      base01 = "#181825";
      base02 = "#313244";
      base03 = "#45475a";
      base04 = "#585b70";
      base05 = "#cdd6f4";
      base06 = "#f5e0e0";
      base07 = "#b4befe";
      base08 = "#f38ba8";
      base09 = "#fab387";
      base0A = "#f9e2af";
      base0B = "#a6e3a1";
      base0C = "#94e2d5";
      base0D = "#89b4fa";
      base0E = "#cba6f7";
      base0F = "#f2cdcd";
    };

    fonts = {
      monospace = {
        package = pkgs.iosevka;
        name = "Iosevka";
      };
    };

    opacity.terminal = 0.7;
  };

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
    settings = {
        confirm_os_window_close = 0;
    };
  };

  programs.lazygit.enable = true;
}
