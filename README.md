<h1 align="center">
  🎓 + 🚀
  <br>Moodle Section<br>
</h1>

<h4 align="center">
  A <a href="https://moodle.org" target="_blank">Moodle</a> section for Spaceship prompt
</h4>

## Installing

You need to source this plugin somewhere in your dotfiles. Here's how to do it with some popular tools:

### [Oh-My-Zsh]

Execute this command to clone this repo into Oh-My-Zsh plugin's folder:

```zsh
git clone https://github.com/ragusa87/section-moodle.git $ZSH_CUSTOM/plugins/section-moodle
```

Include `section-moodle` in Oh-My-Zsh plugins list:

```zsh
plugins=($plugins section-moodle)
```

### [zplug]

```zsh
zplug "ragusa87/section-moodle"
```

### [antigen]

```zsh
antigen bundle "ragusa87/section-moodle"
```

### [antibody]

```zsh
antibody bundle "ragusa87/section-moodle"
```

### [zinit]

```zsh
zinit light "ragusa87/section-moodle"
```

### [zgen]

```zsh
zgen load "ragusa87/section-moodle"
```

### [sheldon]

```toml
[plugins.section-moodle]
github = "ragusa87/section-moodle"
```

### Manual

If none of the above methods works for you, you can install Spaceship manually.

1. Clone this repo somewhere, for example to `$HOME/.zsh/section-moodle`.
2. Source this section in your `~/.zshrc`.

### Example

```zsh
mkdir -p "$HOME/.zsh"
git clone --depth=1 https://github.com/ragusa87/section-moodle.git "$HOME/.zsh/section-moodle"
```

For initializing prompt system add this to your `.zshrc`:

```zsh title=".zshrc"
source "~/.zsh/section-moodle/section-moodle.plugin.zsh"
```

## Usage

After installing, add the following line to your `.zshrc` in order to include Ember section in the prompt:

```zsh
spaceship add section-moodle
```

## Options

This section is shown only in directories within a Moodle context.

| Variable                   |              Default               | Meaning                             |
|:---------------------------|:----------------------------------:|-------------------------------------|
| `SPACESHIP_MOODLE_SHOW`    |               `true`               | Show section                        |
| `SPACESHIP_MOODLE_ASYNC`   |               `true`               | Render section asynchronously       |
| `SPACESHIP_MOODLE_PREFIX`  | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                    |
| `SPACESHIP_MOODLE_SUFFIX`  | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_MOODLE_SYMBOL`  |               `🎓 `                | Symbol displayed before the section |
| `SPACESHIP_MOODLE_COLOR`   |               `blue`               | Section's color                     |

## Contributing

First, thanks for your interest in contributing!

Contribute to this repo by submitting a pull request. Please use [conventional commits](https://www.conventionalcommits.org/), since this project adheres to [semver](https://semver.org/) and is automatically released via [semantic-release](https://github.com/semantic-release/semantic-release).

## License

MIT © [Name Surname](http://yourwebsite.com)

<!-- References -->

[Oh-My-Zsh]: https://ohmyz.sh/
[zplug]: https://github.com/zplug/zplug
[antigen]: https://antigen.sharats.me/
[antibody]: https://getantibody.github.io/
[zinit]: https://github.com/zdharma/zinit
[zgen]: https://github.com/tarjoilija/zgen
[sheldon]: https://sheldon.cli.rs/
