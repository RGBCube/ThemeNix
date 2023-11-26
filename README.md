# ThemeNix

Theme your NixOS configuration consistently.

## Usage

Firstly, add the flake to your inputs.
You don't need to pin anything since it doesn't depend on anything.

Then you can use any theme you'd like by selecting an attribute, like `themes.gruvbox-dark-hard`.

Themes have 2 special properties, which are `with0x` and `withHashtag`.
This will prefix every color with the thing you selected.

```nix
let
  normal   = themes.windows-95.base00; # => 000000
  with0x   = themes.windows-95.with0x.base00; # => 0x000000
  wHashtag = themes.windows-95.withHashtag.base00; # => #000000
in {}
```

If you don't want to use the base16 color names,
there are also aliases that point to the base16 color.

Here is a full list:

```nix
background                        = base00;
lighterBackground                 = base01;
selectionBackground               = base02;
comment                           = base03;
invisible                         = base03;
lineHighlight                     = base03;
darkForeground                    = base04;
defaultForeground                 = base05;
caret                             = base05;
delimiter                         = base05;
operator                          = base05;
lightForeground                   = base06;
lightBackground                   = base07;
variable                          = base08;
xmlTag                            = base08;
markupLinkText                    = base08;
markupList                        = base08;
diffDeleted                       = base08;
integer                           = base09;
boolean                           = base09;
constant                          = base09;
xmlAttributes                     = base09;
markupLinkUrl                     = base09;
classes                           = base0A;
markupBold                        = base0A;
searchTextBackground              = base0A;
strings                           = base0B;
inheritedClass                    = base0B;
markupCode                        = base0B;
diffInserted                      = base0B;
support                           = base0C;
regularExpression                 = base0C;
escapeCharacter                   = base0C;
markupQuote                       = base0C;
function                          = base0D;
method                            = base0D;
attributeId                       = base0D;
heading                           = base0D;
keyword                           = base0E;
storage                           = base0E;
selector                          = base0E;
markupItalic                      = base0E;
diffChanged                       = base0E;
deprecated                        = base0F;
openingClosingEmbeddedLanguageTag = base0F;
```

Here is a minimal usage example:

```nix
{
  description = "Dankest NixOS configuration.";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    homeManager = {
      url                    = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    themes = {
      url = "github:RGBCube/ThemeNix";
    };
  };

  outputs = { nixpkgs, themes, ... }: let
    theme = themes.gruvbox-dark-hard;
  in {
    nixosConfigurations.myhost = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        homeManager.nixosModules.default
        {
          home-manager.users.myuser.programs.kitty.settings = with theme.withHashtag; {
            color0 = base00; # Could also be `background`.
            color1 = base01;
            # ...
            color10 = baseA;
            color11 = baseB;
            # ...
          };
        }
      ];
    };
  }
}
```

## Credits

- Themes were taken from https://github.com/tinted-theming/base16-schemes.

## License

```
MIT License

Copyright (c) 2023-present RGBCube

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
