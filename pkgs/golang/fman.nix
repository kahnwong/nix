with import <nixpkgs> { } ;

buildGoModule rec {
  pname = "fman";
  version = "1.20.1";

  src = fetchFromGitHub {
    owner = "nore-dev";
    repo = "fman";
    rev = "v${version}";
    sha256 = "sha256-i4+O5AMhEG4c3Dbn3FlVx2olNQXaCyWIFv6ltNPbWXg=";
  };

  vendorSha256 = "sha256-pvFOnkKu7u4KANapFR84B/a/7Z8lUg3higX+CI9QOxQ=";
}
