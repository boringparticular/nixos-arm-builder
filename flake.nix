{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      system = system;
    };
  in {
    formatter.${system} = pkgs.alejandra;
    armBuilder = nixpkgs.lib.nixosConfiguration {
      inherit system;
      modules = [
        ./configuration.nix
      ];
    };
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        alejandra
        # nixd
      ];
    };
  };
}
