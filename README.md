<div align="center">

# asdf-claude-ma [![Build](https://github.com/ericksprengel/asdf-claude-ma/actions/workflows/build.yml/badge.svg)](https://github.com/ericksprengel/asdf-claude-ma/actions/workflows/build.yml) [![Lint](https://github.com/ericksprengel/asdf-claude-ma/actions/workflows/lint.yml/badge.svg)](https://github.com/ericksprengel/asdf-claude-ma/actions/workflows/lint.yml)

[asdf-claude-ma](https://github.com/ericksprengel/asdf-claude-ma) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

This is an [asdf](https://asdf-vm.com) plugin, but it is **not** for managing software versions. It is for **multi-account (ma)**: you use asdf’s per-directory `.tool-versions` mechanism so each workspace can switch which Claude account profile is active. In short, it lets you manage multiple Claude accounts through the same asdf workflow you already use for tools.

**This plugin does not install Claude Code.** It is only a thin wrapper so you can keep separate credentials and config per labeled account. Aside from [installing Claude Code yourself](#important-setup-notes), the plugin does not add other dependencies.

# Contents

- [Install](#install)
- [Important setup notes](#important-setup-notes)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

# Install

Plugin:

```shell
asdf plugin add claude-ma https://github.com/ericksprengel/asdf-claude-ma.git
```

There is no “latest version” to install in the usual asdf sense: the value you set is an **account label** (any name you choose), not a semver.

# Important setup notes

1. **Install Claude Code separately.** This plugin does not download or install the `claude` CLI. Follow Anthropic’s [Get started](https://github.com/anthropics/claude-code?tab=readme-ov-file#get-started) steps first.

2. **How isolation works.** Under the hood, the plugin sets [`CLAUDE_CONFIG_DIR`](https://code.claude.com/docs/en/authentication#credential-management) to a per-label directory (for example `~/.claude-<label>`), then runs the real `claude` binary. Each entry in `.tool-versions` is therefore a separate config home, which is how Claude Code keeps OAuth and related settings apart per profile.

3. **Where credentials live.** Claude Code’s behavior for keychain vs file storage and overrides is described under [Credential management](https://code.claude.com/docs/en/authentication#credential-management) in the official authentication docs.

# Usage

In each project or directory, set the account name in `.tool-versions`:

```text
claude-ma personal
```

`personal` is only an example; use any label you like.

Examples for different spaces:

**Company workspace** — `src/Projects/my-company/.tool-versions`:

```text
claude-ma my-company
```

**Personal workspace** — `src/Projects/personal/.tool-versions`:

```text
claude-ma personal
```

**University workspace** — `src/Projects/my-university/.tool-versions`:

```text
claude-ma my-university
```

The Claude CLI will prompt you to log in separately for each account profile when you use it in that context.

See the [asdf](https://github.com/asdf-vm/asdf) documentation for how `.tool-versions` and directory-local tool configuration work.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/ericksprengel/asdf-claude-ma/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Erick Massa Sprengel](https://github.com/ericksprengel/)
