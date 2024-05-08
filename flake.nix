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
            "x86_64-linux" = "07q9bj8cnvf4xvs6q46vlbq21zk9mnkpd3cxahfj5gck3vhc2ha2";
            "aarch64-linux" = "0b4b2s30pg5fgzfyj2sq6j5rfqchqsx283zzsxvhvzk1xnis830v";
            "x86_64-darwin" = "05x9q4walxgrsbs4cyjzpsy0qp6li767zpka9gy30bc47v2gkhqx";
            "aarch64-darwin" = "0hr09l2mjc5dmsf1vfqd741nzrj3al90mqfnhqdsnzv1rl2f36rn";
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
