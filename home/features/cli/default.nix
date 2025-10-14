{ pkgs, ... }: {
    imports = [
        ./zsh.nix
        ./fzf.nix
        ./helix.nix
        ./yazi.nix
    ];

    programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
    };

    programs.eza = {
        enable = true;
        enableZshIntegration = true;
        extraOptions = ["-l" "--icons" "--git" "-a"];
    };

    home.packages = with pkgs; [
        coreutils
        fd
        htop
        httpie
        jq
        procs
        ripgrep
        tldr

        zip
        xz
        unzip
        p7zip

        nnn # terminal file manager
        fastfetch
    ];
}