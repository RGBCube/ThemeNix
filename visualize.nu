#!/usr/bin/env nu

def complete [] {
  ls themes
}

# Visualizes a theme in the terminal.
def main [
  theme: string@complete # The path to the theme to visualize.
] {
  if not ($env.COLORTERM | str contains "truecolor") {
    echo "your terminal emulator doesn't support truecolor, colors may be wrong\n"
  }

  let theme = open $theme
  | str replace --all ";" ","
  | str replace --all "=" ":"
  | from json

  $theme
  | reject name author
  | transpose key value
  | each {|it|
    let color = { bg: ("#" + $it.value) }

    echo $"($it.key): (ansi $color)          (ansi reset)"
  }

  $"\n($theme.name) by ($theme.author)"
}
