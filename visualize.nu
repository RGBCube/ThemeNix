#!/usr/bin/env nu

# Visualizes a theme in the terminal.
def main [
  theme: string # The path to the theme to visualize.
] {
  if not ($env.COLORTERM | str contains "truecolor") {
    print "your terminal emulator doesn't support truecolor, colors may be wrong\n"
  }

  let theme = open $theme
  | str replace --all ";" ","
  | str replace --all "=" ":"
  | from json

  $theme
  | reject name author
  | transpose key value
  | each {|it|
    let color_hex = "#" + $it.value
    let color = { bg: $color_hex }

    print $"($it.key) ($color_hex): (ansi $color)          (ansi reset)"
  }

  print $"\n($theme.name) by ($theme.author)"
}
