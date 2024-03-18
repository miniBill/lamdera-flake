{
  description = "Lamdera";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.lamdera-next = pkgs.callPackage ./lamdera.nix {
          version = "next";
          hashes = {
            "x86_64-linux" = "1jzsgjfrsv1nva46ygsa9f6xkxb2afw0w037nyccdg7852sq0g5w";
            "aarch64-linux" = "1yaw2sigxarwz7db8md268a3bcy2rck56ac2bs0y27mpm37rm87i";
            "x86_64-darwin" = "1220290xa504s6a5v19qjx818ramxbqqx8zdyyzqb0hr4a8fx083";
            "aarch64-darwin" = "14aksdamr7j1a3ad28g1xkgw42qwxg80wl45188rnb1bg8z35zf0";
          };
        };
        packages.lamdera = pkgs.callPackage ./lamdera.nix {
          version = "1.2.1";
          hashes = {
            "x86_64-linux" = "19ijzsmjr3cpn4hdpnis4dp6hx3p0bp3q9zk3w0b0m0w06d5n7d5";
            "aarch64-linux" = "0jcf7vbz2gc2imlqp8raja4c685kbvpgafkby3qnvq30iy9cw149";
            "x86_64-darwin" = "0bzd41p2398lv46l2kxwj8vh3p129kvl3cp5a0kqc0rmvifvpldl";
            "aarch64-darwin" = "062spdhbb8lh1snqpq79a657wk0jck4nds7iqfabj2z9va2f683d";
          };
        };
        packages.default = self.packages.${system}.lamdera;
      });
}
