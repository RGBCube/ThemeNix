# With Home Manager, do:
#
# xdg.configFile."btop/themes/base16.theme".text = theme.btopTheme;
# programs.btop.settings.color_theme = "base16";
theme: with theme.withHashtag; ''
theme[main_bg]=""

theme[main_fg]="${base05}"

theme[title]="${base06}"

theme[hi_fg]="${base0D}"

theme[selected_bg]="${base01}"

theme[selected_fg]="${base06}"

theme[inactive_fg]="${base03}"

theme[proc_misc]="${base0B}"

theme[cpu_box]="${base03}"

theme[mem_box]="${base03}"

theme[net_box]="${base03}"

theme[proc_box]="${base03}"

theme[div_line]="${base03}"

theme[temp_start]="${base0C}"
theme[temp_mid]="${base0A}"
theme[temp_end]="${base08}"

theme[cpu_start]="${base0C}"
theme[cpu_mid]="${base0A}"
theme[cpu_end]="${base08}"

theme[free_start]="${base08}"
theme[free_mid]="${base0A}"
theme[free_end]="${base0C}"

theme[cached_start]="${base0C}"
theme[cached_mid]="${base0A}"
theme[cached_end]="${base08}"

theme[available_start]="${base08}"
theme[available_mid]="${base0A}"
theme[available_end]="${base0C}"

theme[used_start]="${base0C}"
theme[used_mid]="${base0A}"
theme[used_end]="${base08}"

theme[download_start]="${base08}"
theme[download_mid]="${base0A}"
theme[download_end]="${base0C}"

theme[upload_start]="${base08}"
theme[upload_mid]="${base0A}"
theme[upload_end]="${base0C}"
''
