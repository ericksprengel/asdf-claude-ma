<div align="center">

# asdf-claude-ma [![Build](https://github.com/ericksprengel/asdf-claude-ma/actions/workflows/build.yml/badge.svg)](https://github.com/ericksprengel/asdf-claude-ma/actions/workflows/build.yml) [![Lint](https://github.com/ericksprengel/asdf-claude-ma/actions/workflows/lint.yml/badge.svg)](https://github.com/ericksprengel/asdf-claude-ma/actions/workflows/lint.yml)

[claude-ma](https://github.com/anthropics/claude-code) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add claude-ma
# or
asdf plugin add claude-ma https://github.com/ericksprengel/asdf-claude-ma.git
```

claude-ma:

```shell
# Show all installable versions
asdf list-all claude-ma

# Install specific version
asdf install claude-ma latest

# Set a version globally (on your ~/.tool-versions file)
asdf global claude-ma latest

# Now claude-ma commands are available
claude --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/ericksprengel/asdf-claude-ma/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Erick Massa Sprengel](https://github.com/ericksprengel/)
