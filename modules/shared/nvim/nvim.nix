{
  pkgs,
  inputs,
  ...
}:
let
  neovimconfig = import ./config;
  nvim = inputs.nixvim.legacyPackages.x86_64-linux.makeNixvimWithModule {
    inherit pkgs;
    module = neovimconfig;
  };
in
{
  home.packages = [
    nvim
  ];
}
