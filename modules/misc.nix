{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        neo-cowsay # Cowsay but fast
        fortune # pseudorandom message from a database of quotes
        util-linux # Some general linux utils
        exfat
        exfatprogs
    ];
}