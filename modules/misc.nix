{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        neo-cowsay # Cowsay but fast
        fortune # pseudorandom message from a database of quotes
    ];
}