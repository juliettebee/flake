{
    description = "Juliette's Cool Flake";

    outputs = { self, nixpkgs }: {
        packages.x86_64-darwin.default = with import nixpkgs { system = "x86_64-darwin"; };
        stdenv.mkDerivation {
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
        };
    };
}
