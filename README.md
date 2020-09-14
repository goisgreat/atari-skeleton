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


## Visual Studio Code Tasks

Looking into the source code generated from creating a project, `.vscode/tasks.json` comes preconfigured with the following tasks:

- **clean** - runs `make clean`
- **execute** - runs `make execute`
- **compile** - runs `make compile`
- **run** - builds and runs using `make run`

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