{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscode-fhs # VSCode
    github-desktop # GitHub Desktop
    gitkraken # GitKraken
    mysql-workbench # MySQL Workbench
    nodejs # NodeJS
    nodePackages.pnpm # PNPM
    bun # Bun
  ];
}
