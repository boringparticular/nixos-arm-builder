{pkgs, ...}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # boot.binfmt.emulatedSystems = ["armv7l-linux"];

  users.users = {
    kmies = {
      isNormalUser = true;
      home = "/home/kmies";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJGb5cPrpHA5mLxknm0WInP6NuZylMCE6Z9LT+IRT7J4 kmies@zeus"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOQfx0MkikNczT1S4grgeN+h9YidWhJjG1XcsCiNcFlb kmies@demeter"
      ];
      initialPassword = "1";
      extraGroups = ["wheel"];
    };
  };

  services.openssh = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    neovim
    ripgrep
    git
  ];

  nixpkgs = {
    config.allowUnsupportedSystem = true;
    config.allowBroken = true;
  };

  nix = {
    package = pkgs.nixFlakes;
    settings = {
      sandbox = false;
      experimental-features = ["nix-command" "flakes"];
      # auto-optimise-store = true;
      builders-use-substitutes = true;
      substituters = [
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = ["@wheel"];
      warn-dirty = false;
    };
  };

  system.stateVersion = "23.05";
}
