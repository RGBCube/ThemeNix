#!/usr/bin/env nu

def theme-to-nix [
  theme: record # The theme to convert to Nix.
] {
  $theme
  | items {|key, value|
    let key = match $key {
      "scheme" => "name  "
      _ => $key
    }

    let value = if ($key | str starts-with "base0") {
      $value | str upcase
    } else {
      $value
    }

    "  " + $key + ' = "' + $value + '";'
  }
  | prepend "{"
  | append "}\n"
  | str join "\n"
}

def generate-valid-themes [] {
  echo "generating themes.nix..."

  ls themes
  | each { |it| '  "' + ($it.name | path parse | get stem) + '" = import ./' + $it.name + ";" }
  | prepend "{"
  | append "}\n"
  | str join "\n"
  | save --force themes.nix
}

def main [] {
  if not ("base16-schemes" | path exists) {
    echo "base16-schemes doesn't exist, cloning..."
    git clone https://github.com/tinted-theming/base16-schemes
  } else {
    echo "base16-schemes exists, updating"
    cd base16-schemes
    git pull
    cd ..
  }

  echo "deleting old themes..."
  rm -rf themes
  mkdir themes

  ls base16-schemes
  | filter {
    let extension = ($in.name | path parse | get extension)

    $extension == "yml" or $extension == "yaml"
  }
  | each { |it|
    let new_path = "themes/" + ($it.name | path parse | get stem) + ".nix"

    echo $"converting ($it.name) to ($new_path)..."

    theme-to-nix (open $it.name) | save $new_path
  }

  generate-valid-themes
}
