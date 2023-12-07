# With https://github.com/clo4/ghostty-hm-module, do:
#
# programs.ghostty.settings.config-file = [
#   (toString (pkgs.writeText "base16-theme" myTheme.ghosttyConfig))
# ];
theme: with theme.withHashtag; ''
background = ${base00}
foreground = ${base05}

selection-background = ${base02}
selection-foreground = ${base00}

palette = 0=${base00}
palette = 1=${base08}
palette = 2=${base0B}
palette = 3=${base0A}
palette = 4=${base0D}
palette = 5=${base0E}
palette = 6=${base0C}
palette = 7=${base05}
palette = 8=${base03}
palette = 9=${base08}
palette = 10=${base0B}
palette = 11=${base0A}
palette = 12=${base0D}
palette = 13=${base0E}
palette = 14=${base0C}
palette = 15=${base07}
palette = 16=${base09}
palette = 17=${base0F}
palette = 18=${base01}
palette = 19=${base02}
palette = 20=${base04}
palette = 21=${base06}
''
