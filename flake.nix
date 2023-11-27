{
  description = "Theme your NixOS configuration consistently.";

  outputs = { self }: {
    custom = theme: let
      onlyColors = builtins.removeAttrs theme [ "name" "author" ];

      with0x      = theme // (builtins.mapAttrs (_: value: "0x" + value) onlyColors);
      withHashtag = theme // (builtins.mapAttrs (_: value: "#" + value)  onlyColors);
    in theme // {
      inherit with0x withHashtag;

      tmTheme       = (import ./templates/tmTheme.nix) theme;
      adwaitaGtkcss = (import ./templates/adwaitaGtkCss.nix) theme;
    };
  } // builtins.mapAttrs (_: self.custom) (import ./themes.nix);
}
