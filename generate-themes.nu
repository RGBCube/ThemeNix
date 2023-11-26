#!/usr/bin/env nu

def theme-to-nix [
  theme: record, # The theme to convert to Nix.
] {
  $theme
  | to json
  | lines
  | each { |line|
    if ($line | str trim | str starts-with '"base') {
      let line_parts = $line
                 | str replace '"' ""
                 | str replace '"' ""
                 | str replace "," ";"
                 | split row ": "

      let line = $line_parts.0 + " = " + ($line_parts.1 | str upcase)

      if not ($line | str ends-with ";") {
        $line + ";"
      } else {
        $line
      }
    } else {
      $line
      | str replace "scheme" "name  "
      | str replace "slug" "slug  "
      | str replace '"' ""
      | str replace '"' ""
      | str replace ":" " ="
      | str replace --all "," ";"
    }
  }
  | append ""
  | str join "\n"
}

def generate-valid-themes [] {
  echo "generating themes.nix..."

  ls themes
  | each { $in.name | str replace ".nix" "" }
  | each { |it| '  "' + ($it | path basename) + '" = import ./' + $it + ".nix;" }
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

  ls base16-schemes
    | filter { ($in.name | str ends-with ".yml") or ($in.name | str ends-with ".yaml") }
    | each { |it|
      let new_path = "themes/" + ($it.name | path basename | split row "." | first)

      echo $"converting ($it.name) to ($new_path)..."

      theme-to-nix ({ slug: ($new_path | split row "/" | last) } | merge (open $it.name)) | save --force ($new_path + ".nix")
    }

  generate-valid-themes
}
