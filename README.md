# Atari Project Creater

## What is the Atari Project Creater?
The *Atari Project Creater* (definitely copyrighted) is a platform made with ease of development in mind.

## Usage
Clone this repository:
```bash
git clone git@github.com:goisgreat/atari-skeleton.git
```

Run make to build your project:
```bash
make create project=YourProjectName
```

This will create a subfolder for your new project.

## Visual Studio Code tasks
Looking into the source code generated from creating a project, `.vscode/tasks.json` comes preconfigured with the following tasks:

- **clean** to clean everything from the `bin`
- **execute** to emulate the current project
- **compile** to
- **run** to compile *and* execute (this is the default build task for vscode users)

## Using tasks with other editors
If you *don't* use vscode and you *still* want to use these preconfigured tasks, don't worry!
You can still invoke these tasks using the `make` program. Simply run `make compile` to compile, `make execute` to execute, etc.

## Makefiles

As a quick sidenote for anyone wishing to see the commands ran when `compile`, `execute`, `run`, or `clean`, the default makefile is located in `.assets`.
All source code for the *Atari Project Creater* (not including that which is generated when creating a project) can be found in `master/Makefile`.

## Credits
`README.md`:

* Addison Brendtro
* Steven Brendtro

*Atari Project Creater* core:

* Addison Brendtro
* Code Koala (for emotional support as well as words of wisdom.)
