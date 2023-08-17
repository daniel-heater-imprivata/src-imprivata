with (import <nixpkgs> {});
stdenv.mkDerivation {
  name = "java-dev";
  buildInputs = [
    jacoco
    jdk8
    maven
    java-language-server
  ];
}
