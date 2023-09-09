{...}: {
  users.users = {
    kmies = {
      isNormalUser = true;
      home = "/home/kmies";
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJGb5cPrpHA5mLxknm0WInP6NuZylMCE6Z9LT+IRT7J4 kmies@zeus"];
      initialPassword = "1";
      extraGroups = ["wheel"];
    };
  };
}
