{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    
    profiles.rocksus = {
        settings = {
            browser.profiles.enabled=true;
        };
    };
  };
}
