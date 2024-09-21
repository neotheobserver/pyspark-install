# PYSPARK INSTALLATION

The shell script above can be used in debian based linux system to install pyspark in a virtual environment.

Jupyter-Notebook will also be installed.

## How to use

- Clone the repo

```sh
git clone https://github.com/neotheobserver/pyspark-install.git
cd pyspark-install
```

- Make the shell file executable

```sh
chmod +x pyspark-installation.sh
```

Alternatively, you can run it with `bash` command

- Run the shell file

```sh
./pyspark-installation.sh 3.3.1 1.12.99
```

Here,

`3.3.1` is the version of pyspark

`1.12.99` is the version of aws bundle [This is optional]

## Prerequisites

- Latest installation of python, pip, and venv
- Java installed (the pyspark version to be installed must support the installed java)
- JAVA_HOME environment variable set
- Curl command line utility
