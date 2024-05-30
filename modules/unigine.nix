{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    unigine-superposition
    unigine-sanctuary
    unigine-tropics
    unigine-heaven
    unigine-valley
  ];
}
