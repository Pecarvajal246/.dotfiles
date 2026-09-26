# .bash_profile
#
# Environment for the whole login session. GNOME starts through a login
# shell, so shortcuts and apps launched from it inherit what is set here.
# Keep interactive-only setup (aliases, prompt, fnm env) in ~/.bashrc.

export EDITOR=nvim
export VISUAL=nvim
export PNPM_HOME="$HOME/.local/share/pnpm"
export ENCORE_INSTALL="$HOME/.encore"

# Each directory is prepended, so the last one listed ends up first in PATH.
# Missing directories are skipped and existing entries are not duplicated.
for d in \
  /usr/local/android-studio/bin \
  /usr/bin/flutter/bin \
  "$HOME/Applications" \
  "$HOME/.foundry/bin" \
  "$HOME/.opencode/bin" \
  "$ENCORE_INSTALL/bin" \
  "$PNPM_HOME" \
  "$HOME/.cargo/bin" \
  "$HOME/.local/bin"
do
  [ -d "$d" ] || continue
  case ":$PATH:" in
    *":$d:"*) ;;
    *) PATH="$d:$PATH" ;;
  esac
done
export PATH
unset d

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
