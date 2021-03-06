{ pkgs ? (import ./../pkgs.nix),
  generate_programs_index ? (import ./../generate_programs_index {}),
  pythonPackages ? pkgs.python35Packages,
}:
with pkgs;

pythonPackages.buildPythonPackage rec {
  name = "nixipfs-${version}";
  version = "0.4.0";
  src = ./.;
  propagatedBuildInputs = with pythonPackages; [
    python
    ipfsapi
    nixUnstable
    generate_programs_index
  ];
}
