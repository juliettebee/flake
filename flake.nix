{
  description = "Juliette's Cool Flake";

  outputs = { self, nixpkgs }: {
    batteryBuddy.url = "https://batterybuddy.app/releases/Battery%20Buddy.zip";
    batteryBuddy.flake = false;
  };
}
