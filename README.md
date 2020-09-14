# Atari Skeleton

This simple project is a skeleton project builder for your Visual Studio Code Atari projects.

## Usage
Clone this repository:
```
git clone git@github.com:goisgreat/atari-skeleton.git
```

Run make to build your project:
```
make create project=YourProjectName
```

This will create a subfolder for your new project.


## Visual Studio Code Tasks

`.vscode/tasks.json` comes preconfigured with the following tasks:

- **clean** - runs `make clean`
- **execute** - runs `make execute`
- **compile** - runs `make compile`
- **run** - builds and runs using `make run`

