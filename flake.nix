{
  inputs = { hls.url = "github:haskell/haskell-language-server"; };
  outputs = { self, nixpkgs, hls }: {
    devShell.x86_64-linux = with nixpkgs.legacyPackages.x86_64-linux;
      mkShell {
        buildInputs = [
          nixfmt
          haskellPackages.cabal-install
          haskellPackages.haskell-language-server
          haskellPackages.ghc
        ];
      };
  };
}
