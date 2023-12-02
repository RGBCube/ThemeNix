#!/usr/bin/env nu

# Visualizes a theme in the terminal.
def main [
  theme: string, # The path to the theme to visualize.
] -> nothing {
  if not ($env.COLORTERM | str contains "truecolor") {
    echo "your terminal emulator doesn't support truecolor, colors may be wrong\n"
  }

  let theme = open $theme
  | str replace --all ";" ","
  | str replace --all "=" ":"
  | from json

  $theme
  | reject name author
  | transpose name value
  | each { |it|
    let hex = ("0x" + $in.value) | into int

    let r = $hex bit-shr 16
    let g = $hex bit-shr 8 bit-and 0xFF
    let b = $hex bit-and 0xFF

    $it | merge { value: $"\\033[48;2;($r);($g);($b)m" }
  }
  | each { |it|
    ^echo -e $"($it.name): ($it.value)          \\033[0m"
  }

  $"\n($theme.name) by ($theme.author)"
}
