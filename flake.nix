{
  description = "Theme your NixOS configuration consistently.";

  outputs = { self }: let
    inherit (self.lib.colors) luminance isValidColor;
    inherit (self.lib.strings) fromHexString hasPrefix hexCharToNumber isString match stringLength substring;
    inherit (self.lib.attrsets) mapAttrs;
    inherit (self.lib.trivial) fix;

    raw = import ./themes.nix;

    custom = raw: fix (theme: raw // {
      isDark  = luminance theme.base00 <  luminance theme.base07;
      isLight = luminance theme.base00 >= luminance theme.base07;

      adwaitaGtkCss = (import ./templates/adwaitaGtkCss.nix) theme;
      btopTheme     = (import ./templates/btopTheme.nix)     theme;
      discordCss    = (import ./templates/discordCss.nix)    theme;
      firefoxTheme  = (import ./templates/firefoxTheme.nix)  theme;
      ghosttyConfig = (import ./templates/ghosttyConfig.nix) theme;
      tmTheme       = (import ./templates/tmTheme.nix)       theme;

      with0x      = (mapAttrs (_: value: if isValidColor value then "0x" + value else value) theme);
      withHashtag = (mapAttrs (_: value: if isValidColor value then "#" + value else value)  theme);
    });
  in {
    lib.trivial = {
      fix = f: let x = f x; in x;
    };

    lib.strings = {
      inherit (builtins) substring stringLength isString match;

      hasPrefix = pref: str: substring 0 (stringLength pref) str == pref;

      hexCharToNumber = c:
        if c == "0" then 0
        else if c == "1" then 1
        else if c == "2" then 2
        else if c == "3" then 3
        else if c == "4" then 4
        else if c == "5" then 5
        else if c == "6" then 6
        else if c == "7" then 7
        else if c == "8" then 8
        else if c == "9" then 9
        else if c == "a" || c == "A" then 10
        else if c == "b" || c == "B" then 11
        else if c == "c" || c == "C" then 12
        else if c == "d" || c == "D" then 13
        else if c == "e" || c == "E" then 14
        else if c == "f" || c == "F" then 15
        else throw "invalid hex character (should be 0..=9 | a..=f | A..=F): ${c}";

      fromHexString = hex: let
        length = stringLength hex;

        go = acc: i:
          if i >= length then acc
          else go (acc * 16 + (hexCharToNumber (substring i 1 hex))) (i + 1);
      in go 0 0;
    };

    lib.attrsets = {
      inherit (builtins) mapAttrs;
    };

    lib.colors = {
      isValidColor = thing: if isString thing then
        (match "^[0-9a-fA-F]{6}" thing) != null
      else
        false;

      luminance = hex: let
        r = substring 0 2 hex |> fromHexString;
        g = substring 2 4 hex |> fromHexString;
        b = substring 4 6 hex |> fromHexString;
      in assert !hasPrefix "#" hex;
        0.2126 * r +
        0.7152 * g +
        0.0722 * b ;
    };

    inherit raw custom;
  } // builtins.mapAttrs (name: custom) raw;
}
