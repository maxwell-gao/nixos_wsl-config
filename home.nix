{ config, pkgs, inputs, ... }: 
let
  # Define the custom gcloud package set using a 'let' block
  gdk = pkgs.google-cloud-sdk.withExtraComponents( with pkgs.google-cloud-sdk.components; [
    gke-gcloud-auth-plugin
  ]);
in
{   
  home.username = "nixos";
  home.stateVersion = "25.05";
  
  home.packages = with pkgs; [
    texlive.combined.scheme-full
    pandoc
    gdk
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

