{
  description = "Theme your NixOS configuration consistently.";

  outputs = { self }: {
    custom = theme: let
      onlyColors = builtins.removeAttrs theme [ "name" "author" ];

      with0x      = theme // (builtins.mapAttrs (_: value: "0x" + value) onlyColors);
      withHashtag = theme // (builtins.mapAttrs (_: value: "#" + value)  onlyColors);

      themeFull = theme // {
        inherit with0x withHashtag;
      };
    in themeFull // {
      tmTheme       = (import ./templates/tmTheme.nix) themeFull;
      adwaitaGtkCss = (import ./templates/adwaitaGtkCss.nix) themeFull;
    };
  } // builtins.mapAttrs (name: self.custom) (import ./themes.nix);
}
