{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscode-fhs # VSCode
    github-desktop # GitHub Desktop
    gitkraken # GitKraken
    # mysql-workbench # MySQL Workbench - currently broken
    nodejs # NodeJS
    nodePackages.pnpm # PNPM
    bun # Bun
    postman # API Development and such
  ];
}
