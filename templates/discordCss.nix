# With Home Manager, set `xdg.configFile."Vencord/settings/quickCss.css"` to this:
#
# xdg.configFile."Vencord/settings/quickCss.css".text = myTheme.discordCss;
#
# These instructions only work for Vencord.
# Consult your client mods docs if you don't use Vencord.
theme: with theme.withHashtag; ''
:root {
  --background-primary: ${base00};
  --background-secondary: ${base00};
  --background-tertiary: ${base00};
  --channels-default: ${base0D};
  --channeltextarea-background: ${base01};
  --deprecated-panel-background: ${base00};
  --interactive-normal: ${base06};
  --text-normal: ${base06};
}

.da-autocomplete,
.da-autocompleteHeaderBackground
.da-container,
.da-footer,
.da-friendsTable,
.da-friendsTableHeader,
.da-header,
.da-popouts,
.da-systemPad,
.da-themedPopout,
.da-userPopout > * {
  background-color: var(--background-secondary) !important;
  border-color: transparent !important;
}

.theme-dark,
.da-messageGroupWrapper {
  background-color: var(--background-tertiary) !important;
  border-color: transparent;
}

.theme-dark,
.da-option:after {
  background-image: none !important;
}

.theme-dark,
.ui-tab-bar-item {
  color: var(--interactive-normal);
}

.da-addButtonIcon,
.theme-dark,
.ui-tab-bar-header {
  color: var(--channels-default) !important;
}

.da-autocompleteRow,
.da-selectorSelected,
.theme-dark,
.theme-dark,
.ui-tab-bar-item.selected {
  background-color: var(--background-modifier-selected);
  color: var(--interactive-active);
}

.da-contents,
.da-emojiButtonNormal,
.da-sprite {
  filter: sepia(1) !important;
}


.da-messagesWrapper,
.da-messagesWrapper,
.da-scroller::-webkit-scrollbar,
.da-scroller::-webkit-scrollbar-track-piece {
  background-color: var(--background-tertiary) !important;
  border-color: rgba(0,0,0,0) !important;
}

.da-scroller::-webkit-scrollbar-thumb,
.da-scroller::-webkit-scrollbar-thumb,
.da-scrollerThemed,
.da-scrollerWrap {
  background-color: var(--background-secondary) !important;
  border-color: var(--background-tertiary) !important;
}

.hljs-deletion,
.hljs-formula,
.hljs-keyword,
.hljs-link,
.hljs-selector-tag {
  color: ${base08};
}

.hljs-built_in,
.hljs-emphasis,
.hljs-name,
.hljs-quote,
.hljs-strong,
.hljs-title,
.hljs-variable {
  color: ${base0D};
}

.hljs-attr,
.hljs-params,
.hljs-template-tag,
.hljs-type {
  color: ${base0A};
}

.hljs-builtin-name,
.hljs-doctag,
.hljs-literal,
.hljs-number {
  color: ${base0E};
}

.hljs-code,
.hljs-meta,
.hljs-regexp,
.hljs-selector-id,
.hljs-template-variable {
  color: ${base09};
}

.hljs-addition,
.hljs-meta-string,
.hljs-section,
.hljs-selector-attr,
.hljs-selector-class,
.hljs-string,
.hljs-symbol {
  color: ${base0B};
}

.hljs-attribute,
.hljs-bullet,
.hljs-class,
.hljs-function,
.hljs-function,
.hljs-keyword,
.hljs-meta-keyword,
.hljs-selector-pseudo,
.hljs-tag {
  color: ${base0C};
}

.hljs-comment {
  color: ${base03};
}

.hljs-link_label,
.hljs-literal,
.hljs-number {
  color: ${base0E};
}

.hljs-comment,
.hljs-emphasis {
  font-style: italic;
}

.hljs-section,
.hljs-strong,
.hljs-tag {
  font-weight: bold;
}
''
