{ config, pkgs, inputs, ... }: 
{   
  home.username = "nixos";
  home.stateVersion = "25.05";
  
  home.packages = with pkgs; [
    texlive.combined.scheme-full
    pandoc
  ];
  # Zsh configuration
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };
}

