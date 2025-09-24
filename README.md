# ZSH Configuration

This repository contains a collection of ZSH scripts and configurations.

## Setup

1.  **Clone the repository:**

    ```bash
    git clone <repository-url> ~/.config/zsh
    ```

2.  **Source the configuration files:**

    Add the following lines to your `~/.zshrc` file:

    ```bash
    source ~/.config/zsh/aliases.zsh
    source ~/.config/zsh/env.zsh
    ```

3.  **Restart your shell or source your `~/.zshrc`:**

    ```bash
    source ~/.zshrc
    ```

## Usage

### `gitout`

This command provides an interactive way to checkout a git branch using `fzf`.

To use it, simply run:

```bash
gitout
```
