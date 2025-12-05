{ ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ls = "eza -a";
      nix-rebuild = "sudo nixos-rebuild switch --flake /home/kacper/.nix-config#nixos && source ~/.zshrc";
      nix-dev = "nix develop --command zsh";
    };

    syntaxHighlighting = {
      enable = true;
      styles = {
        # Alarming/Error Color: Light Red (#FF7070)
        unknown-token = "fg=#FF7070,bold";

        # Command/Execution Colors: Light Green (#90E090)
        command = "fg=#90E090,bold";
        hashed-command = "fg=#90E090";
        builtin = "fg=#90E090";
        function = "fg=#90E090";
        autodirectory = "fg=#90E090";

        # Shell Structure/Keywords: Light Magenta (#E4B8F3)
        reserved-word = "fg=#E4B8F3,bold";
        alias = "fg=#E4B8F3";
        suffix-alias = "fg=#E4B8F3";
        global-alias = "fg=#E4B8F3";
        precommand = "fg=#E4B8F3";

        # File Paths/Navigation: Icy Blue (#83B6FF)
        path = "fg=#83B6FF";
        path_prefix = "fg=#83B6FF";
        path_pathseparator = "fg=#83B6FF";
        path_prefix_pathseparator = "fg=#83B6FF";

        # Globbing/Wildcards: Light Cyan (#B6DAFF)
        globbing = "fg=#B6DAFF";
        history-expansion = "fg=#B6DAFF";

        # Variables/Expansion/Substitution: Light Yellow (#FFE0A8)
        command-substitution = "fg=#FFE0A8";
        command-substitution-unquoted = "fg=#FFE0A8";
        command-substitution-quoted = "fg=#FFE0A8";
        command-substitution-delimiter = "fg=#FFE0A8";
        command-substitution-delimiter-unquoted = "fg=#FFE0A8";
        command-substitution-delimiter-quoted = "fg=#FFE0A8";
        process-substitution = "fg=#FFE0A8";
        process-substitution-delimiter = "fg=#FFE0A8";
        arithmetic-expansion = "fg=#FFE0A8";
        dollar-double-quoted-argument = "fg=#FFE0A8";
        assign = "fg=#FFE0A8,bold";

        # Quotes/String Literals: Pure White (#FFFFFF)
        single-quoted-argument = "fg=#FFFFFF";
        double-quoted-argument = "fg=#FFFFFF";
        dollar-quoted-argument = "fg=#FFFFFF";

        # Unclosed Strings/Errors (High Alert): Bright Red (#FF8E8E)
        single-quoted-argument-unclosed = "fg=#FF8E8E,bold,underline";
        double-quoted-argument-unclosed = "fg=#FF8E8E,bold,underline";
        dollar-quoted-argument-unclosed = "fg=#FF8E8E,bold,underline";
        back-quoted-argument-unclosed = "fg=#FF8E8E,bold,underline";

        # Low Contrast/Secondary Elements: Medium Gray (#888888)
        comment = "fg=#888888,italic"; # Comments should be subtle
        arg0 = "fg=#FFFFFF"; # Command arguments are regular text
        default = "fg=#FFFFFF";

        # Miscellaneous and specific styles
        commandseparator = "fg=#FFFFFF";
        redirection = "fg=#83B6FF"; # Icy Blue

        # Backtick/Old Command Substitution (often deprecated)
        back-quoted-argument = "fg=#FFE0A8";
        back-quoted-argument-delimiter = "fg=#FFE0A8";

        # Numeric/File Descriptors
        named-fd = "fg=#B6DAFF"; # Light Cyan
        numeric-fd = "fg=#B6DAFF";

        # Option Flags
        single-hyphen-option = "fg=#83B6FF";
        double-hyphen-option = "fg=#83B6FF";

        # Backslash/Escape sequences (use a secondary bright color)
        back-double-quoted-argument = "fg=#A9F0A9";
        back-dollar-quoted-argument = "fg=#A9F0A9";
        rc-quote = "fg=#FFFFFF";
      };
    };

    autosuggestion = {
      enable = true;
      highlight = "fg=#888888";
    };

    initContent = ''
      		            git_branch_name() {
                    branch=$(git symbolic-ref HEAD 2> /dev/null | awk -F'/' '{print $NF}')

                    if [[ -n "$branch" ]]; then
                      git_changes=$(git status --porcelain 2>/dev/null)

                      dirty=""
                      staged=""
                      untracked=""

                      [[ $(echo "$git_changes" | grep "^.M") ]] && dirty="*"
                      [[ $(echo "$git_changes" | grep "^A") ]] && staged="+"
                      [[ $(echo "$git_changes" | grep "^??") ]] && untracked="#"

                      git_status_indicator="$dirty$staged$untracked"
                      echo " %F{#83B6FF}git:%f%F{#FF7070}($branch%F{#FFE0A8}$git_status_indicator%F{#FF7070})%f"
                    fi
                  }

                  setopt prompt_subst


            			if [[ -n $IN_NIX_SHELL ]]; then
                  	prompt='%F{#B6DAFF}󱄅 %f %F{#FFFFFF}%1/%f$(git_branch_name) %F{yellow}~%f '
            			else
                  	prompt='%F{#FFFFFF}%1/%f$(git_branch_name) %F{yellow}~%f '
            			fi

      						'';
  };
}
