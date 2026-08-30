{pkgs, config, ...}:

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
    thunar
    anyrun

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

    # TODO: Change colors and other options
    base16Scheme = {
      base00 = "#101114";
      base01 = "#16181D";
      base02 = "#20232B";
      base03 = "#30343E";
      base04 = "#454B57";
      base05 = "#D6DAE2";
      base06 = "#E2E5EB";
      base07 = "#F0F2F5";
      base08 = "#C94F68"; 
      base09 = "#C4875F"; 
      base0A = "#D1B05F"; 
      base0B = "#76A85F"; 
      base0C = "#5CB7AA"; 
      base0D = "#6289C4"; 
      base0E = "#9B70C2"; 
      base0F = "#B88Be0"; 
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
  programs.anyrun = {
    enable = true;

    config = {
      x.fraction = 0.5;
      y.fraction = 0.3;
      width.fraction = 0.3;

      closeOnClick = true;
      maxEntries = 8;
      hidePluginInfo = true;

      plugins = [
        "${pkgs.anyrun}/lib/libapplications.so"
        "${pkgs.anyrun}/lib/librink.so"
        "${pkgs.anyrun}/lib/libshell.so"
      ];
    };

    extraCss = ''
      @define-color accent     #${config.lib.stylix.colors.base0D};
      @define-color bg-color   #${config.lib.stylix.colors.base00};
      @define-color fg-color   #${config.lib.stylix.colors.base06};
      @define-color desc-color #${config.lib.stylix.colors.base05};

      * {
          font-family: Iosevka;
          font-size: 22px
      }

      window {
        background: transparent;
      }

      box.main {
        margin: 10px;
        border-radius: 10px;
        border: 2px solid alpha(@accent, 0.7);
        background-color: alpha(@bg-color, 0.7);
      }

      text {
        min-height: 30px;
        padding: 5px;
        border-radius: 5px;
        color: @fg-color;
      }

      .matches {
        background-color: rgba(0, 0, 0, 0);
        border-radius: 10px;
      }

      list {
        background: transparent;
      }

      label.match {
        color: @fg-color;
      }

      label.match.description {
        font-size: 15px;
        color: @desc-color;
      }

      .match {
        background: transparent;
      }

      .match:selected {
        background: alpha(@accent, 0.7);
      }
    '';
  };

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
      rebuild = "sudo nixos-rebuild switch --flake ~/.dotsfiles#laptop";
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
