{
  description = "Theme your NixOS configuration consistently.";

  outputs = { self }: builtins.mapAttrs (slug: theme: let
    themeDescriptiveNames = with theme; {
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
    };

    themeWithSlug = theme // {
      inherit slug;
    };

    enrichedTheme = themeWithSlug // themeDescriptiveNames;

    enrichedThemeOnlyColors = builtins.removeAttrs enrichedTheme [ "name" "author" "slug" ];

    enrichedThemeHelpers = {
      with0x = builtins.mapAttrs (_: value: "0x" + value) (enrichedTheme // enrichedThemeOnlyColors);
      withHashtag = builtins.mapAttrs (_: value: "#" + value) (enrichedTheme // enrichedThemeOnlyColors);
    };

    templates = {
      tmTheme = (import ./templates/tmTheme.nix) theme;
    };
  in enrichedTheme // enrichedThemeHelpers // templates) (import ./themes.nix);
}
