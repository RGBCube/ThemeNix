{
  description = "Theme your NixOS configuration consistently.";

  outputs = { self }: let
    raw = import ./themes.nix;

    isValidColor = thing: if builtins.isString thing then
      (builtins.match "^[0-9a-fA-F]{6}" thing) != null
    else
      false;
  in {
    inherit raw;

    custom = theme: let
      with0x      = theme // (builtins.mapAttrs (_: value: if isValidColor value then "0x" + value else value) theme);
      withHashtag = theme // (builtins.mapAttrs (_: value: if isValidColor value then "#" + value else value)  theme);

      themeFull = theme // {
        inherit with0x withHashtag;
      };
    in themeFull // {
      adwaitaGtkCss = (import ./templates/adwaitaGtkCss.nix) themeFull;
      btopTheme     = (import ./templates/btopTheme.nix)     themeFull;
      discordCss    = (import ./templates/discordCss.nix)    themeFull;
      firefoxTheme  = (import ./templates/firefoxTheme.nix)  themeFull;
      ghosttyConfig = (import ./templates/ghosttyConfig.nix) themeFull;
      tmTheme       = (import ./templates/tmTheme.nix)       themeFull;
    };
  } // builtins.mapAttrs (name: self.custom) raw;
}
