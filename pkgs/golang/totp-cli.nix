with import <nixpkgs> { } ;

buildGoModule rec {
  pname = "totp-cli";
  version = "1.3.0";

  src = fetchFromGitHub {
    owner = "yitsushi";
    repo = "totp-cli";
    rev = "v${version}";
    sha256 = "sha256-tyt+VTTmEA0sFgq4jrjpFPxGOMa8GuihOyZBhM7Epx8=";
  };

  vendorSha256 = "sha256-42h6WnhC02ca4giz23FEG8APNM2sLjFxZS4v+FJo4pA=";
}
