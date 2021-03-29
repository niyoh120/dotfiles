# {{@@ header() @@}}

{%@@ if exists_in_path('code') @@%}
[merge]
    tool = vscode
[mergetool "vscode"]
    cmd = code --wait $MERGED
[diff]
    tool = vscode
[difftool "vscode"]
    cmd = code --wait --diff $LOCAL $REMOTE
{%@@ endif @@%}