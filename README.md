# zig-build-runner

An exploration of using the Zig build system as a general-purpose task runner — not just for Zig projects. The goal is to show that you can get a familiar `just <task>` workflow with almost no changes, using tools you may already have installed.

## How it works

`zig build` is a capable task runner on its own. By aliasing it to `just`, the workflow becomes identical to using a dedicated task runner like [just](https://github.com/casey/just) or `make` — without the extra dependency.

## Alias setup

Add this alias to your shell config:

**zsh** (`~/.zshrc`):
```sh
alias just="zig build"
```

**bash** (`~/.bashrc` or `~/.bash_profile`):
```sh
alias just="zig build"
```

Then reload your shell:
```sh
source ~/.zshrc   # or ~/.bashrc
```

## Usage

```sh
just echo           # Echo a message
just run-script     # Run scripts/hello.sh via bash
just run-with-env   # Run a command with a custom env var
```

Tasks are defined in `build.zig`. Adding a new task is two lines:

```zig
const my_step = b.step("my-task", "Description");
my_step.dependOn(&b.addSystemCommand(&.{ "bash", "scripts/my-task.sh" }).step);
```
