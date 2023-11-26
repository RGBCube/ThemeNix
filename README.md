# ThemeNix

Theme your NixOS configuration consistently.

## Usage

Firstly, add the flake to your inputs.
You don't need to pin anything since it doesn't depend on anything.

Then you can use any theme you'd like by selecting an attribute, like `themes.gruvbox-dark-hard`.

<details>
<summary>All themes</summary>

```
3024 (Hey, if you want to use this theme, you'll have to do `themes."3024"`)
apathy
apprentice
ashes
atelier-cave-light
atelier-cave
atelier-dune-light
atelier-dune
atelier-estuary-light
atelier-estuary
atelier-forest-light
atelier-forest
atelier-heath-light
atelier-heath
atelier-lakeside-light
atelier-lakeside
atelier-plateau-light
atelier-plateau
atelier-savanna-light
atelier-savanna
atelier-seaside-light
atelier-seaside
atelier-sulphurpool-light
atelier-sulphurpool
atlas
ayu-dark
ayu-light
ayu-mirage
bespin
black-metal-bathory
black-metal-burzum
black-metal-dark-funeral
black-metal-gorgoroth
black-metal-immortal
black-metal-khold
black-metal-marduk
black-metal-mayhem
black-metal-nile
black-metal-venom
black-metal
blueforest
blueish
brewer
bright
brogrammer
brushtrees-dark
brushtrees
caroline
catppuccin-frappe
catppuccin-latte
catppuccin-macchiato
catppuccin-mocha
chalk
circus
classic-dark
classic-light
codeschool
colors
cupcake
cupertino
da-one-black
da-one-gray
da-one-ocean
da-one-paper
da-one-sea
da-one-white
danqing-light
danqing
darcula
darkmoss
darktooth
darkviolet
decaf
default-dark
default-light
dirtysea
dracula
edge-dark
edge-light
eighties
embers
emil
equilibrium-dark
equilibrium-gray-dark
equilibrium-gray-light
equilibrium-light
eris
espresso
eva-dim
eva
evenok-dark
everforest-dark-hard
everforest
flat
framer
fruit-soda
gigavolt
github
google-dark
google-light
gotham
grayscale-dark
grayscale-light
greenscreen
gruber
gruvbox-dark-hard
gruvbox-dark-medium
gruvbox-dark-pale
gruvbox-dark-soft
gruvbox-light-hard
gruvbox-light-medium
gruvbox-light-soft
gruvbox-material-dark-hard
gruvbox-material-dark-medium
gruvbox-material-dark-soft
gruvbox-material-light-hard
gruvbox-material-light-medium
gruvbox-material-light-soft
hardcore
harmonic16-dark
harmonic16-light
heetch-light
heetch
helios
hopscotch
horizon-dark
horizon-light
horizon-terminal-dark
horizon-terminal-light
humanoid-dark
humanoid-light
ia-dark
ia-light
icy
irblack
isotope
kanagawa
katy
kimber
lime
macintosh
marrakesh
materia
material-darker
material-lighter
material-palenight
material-vivid
material
mellow-purple
mexico-light
mocha
monokai
mountain
nebula
nord
nova
ocean
oceanicnext
one-light
onedark
outrun-dark
oxocarbon-dark
oxocarbon-light
pandora
papercolor-dark
papercolor-light
paraiso
pasque
phd
pico
pinky
pop
porple
primer-dark-dimmed
primer-dark
primer-light
purpledream
qualia
railscasts
rebecca
rose-pine-dawn
rose-pine-moon
rose-pine
sagelight
sakura
sandcastle
selenized-black
selenized-dark
selenized-light
selenized-white
seti
shades-of-purple
shadesmear-dark
shadesmear-light
shapeshifter
silk-dark
silk-light
snazzy
solarflare-light
solarflare
solarized-dark
solarized-light
spaceduck
spacemacs
standardized-dark
standardized-light
stella
still-alive
summercamp
summerfruit-dark
summerfruit-light
synth-midnight-dark
synth-midnight-light
tango
tarot
tender
tokyo-city-dark
tokyo-city-light
tokyo-city-terminal-dark
tokyo-city-terminal-light
tokyo-night-dark
tokyo-night-light
tokyo-night-storm
tokyo-night-terminal-dark
tokyo-night-terminal-light
tokyo-night-terminal-storm
tokyodark-terminal
tokyodark
tomorrow-night-eighties
tomorrow-night
tomorrow
tube
twilight
unikitty-dark
unikitty-light
unikitty-reversible
uwunicorn
vice
vulcan
windows-10-light
windows-10
windows-95-light
windows-95
windows-highcontrast-light
windows-highcontrast
windows-nt-light
windows-nt
woodland
xcode-dusk
zenbones
zenburn
```
</details>

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

<details>
<summary>All aliases</summary>

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
</details>

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
