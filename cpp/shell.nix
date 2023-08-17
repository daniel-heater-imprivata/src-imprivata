with (import <nixpkgs> {});
let
  my-python-packages = python-packages: with python-packages; [
    # python packages you want
    pip
  ];
  python-with-my-packages = python3.withPackages my-python-packages;
in
stdenvNoCC.mkDerivation {
  name = "c++-dev";
  buildInputs = [
    python-with-my-packages
    perl
    clang-tools
    cmake
    ninja
    qt6.qtbase
    qt6.qttools
  ];

  shellHook = ''
  rm -rf .venv
  python -m venv .venv
  source .venv/bin/activate

  useConanV1=false;
  if [ "$useConanV1" = true ]; then
    pip install conan==1.60.0
    echo $HOME
  else
    pip install conan
  fi
'';
}
