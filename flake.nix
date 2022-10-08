{

    inputs = {
        nixpkgs = {
            url = "github:nixos/nixpkgs/nixos-unstable";
        };
        flake-utils = {
            url = "github:numtide/flake-utils";
        };
    };
    outputs = { nixpkgs, flake-utils, ... }: flake-utils.lib.eachDefaultSystem (system:
            let
            pkgs = import nixpkgs {
            inherit system;
            };
            batteryBuddy = (with pkgs; stdenv.mkDerivation {
                name = "batteryBuddy";
                src = fetchzip {
                url = "https://batterybuddy.app/releases/Battery%20Buddy.zip";
                sha256 = "D52mdxHcqQ4rs8GuQwcNt69wjWFZz+XH3MqfS7Uugxg=";
                };
                installPhase = ''
                runHook preInstall
                APP_DIR="$out/Applications/battery buddy.app"
                mkdir -p "$APP_DIR"
                cp -r . "$APP_DIR"
                runHook postInstall
                '';
                });
            in rec {
#            defaultApp = flake-utils.lib.mkApp {
#                drv = defaultPackage;
#            };
            defaultPackage = batteryBuddy;

            }
            );
}
