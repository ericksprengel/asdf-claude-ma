#!/usr/bin/env bash

set -euo pipefail

# TODO: Ensure this is the correct GitHub homepage where releases can be downloaded for claude-ma.
GH_REPO="https://github.com/anthropics/claude-code"
TOOL_NAME="claude-ma"
TOOL_TEST="claude --version"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

list_all_versions() {
	printf '%s\n' personal work
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	claude_path="$HOME/.local/bin/claude"
	if [ ! -f "$claude_path" ]; then
		fail "Claude not found at $claude_path"
	fi

	(
		mkdir -p "$install_path"
		quoted_claude_path="$(printf '%q' "$claude_path")"
		cat >"$install_path/claude" <<EOF
#!/usr/bin/env bash
export CLAUDE_CONFIG_DIR=~/.claude-${version}
echo "using ~/.claude-${version}"
exec ${quoted_claude_path} "\$@"
EOF
		chmod +x "$install_path/claude"

		# TODO: Assert claude-ma executable exists.
		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
