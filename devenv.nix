{ pkgs, lib, config, inputs, ... }:

{
  packages = [ 
    pkgs.nodejs_20
    pkgs.nodejs_20.pkgs.pnpm
    pkgs.caddy
    pkgs.openssl
  ];

  dotenv.enable = true; 
}
