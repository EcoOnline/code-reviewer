# EcoOnlines implementation for PHP-CS-Fixer

This package takes care of running php-cs-fixer for you whenever committing code.

It utilizes Git's pre-commit feature, and runs php-cs-fixer on the files that have changed.

It will only run when committing code in repositories that are either listed in the official
`whitelist` file, or the custom `whitelist_custom` file.

## Install

```
composer global require ecoonline/code-reviewer
```

Make sure your global vendor binaries directory is in your $PATH environment variable.
Read more [here](https://getcomposer.org/doc/03-cli.md#global)

In short:

```shell
# Get the Composer bin path
composer global config bin-dir --absolute

# Copy the returned value and add it to a new line in this file
sudo vi /etc/paths
```

Run the installer
```shell
code-reviewer
```

## Whitelist

After running `install.sh`, there will be a file called `whitelist_custom` in the 
root of `~/.composer/vendor/ecoonline/code-reviewer`.
Feel free to add any remote to this file, and php-cs-fixer
will run when committing code in those projects.

There's currently no support for running this on projects that have no GIT remote. 
Feel free to add whitelist support for paths as well.

### Adding to the whitelist

Any repository owner can add their repositories to the main whitelist file.

Follow the same syntax as the previous entries. 

#### GitHub URL
Take this highlighted part from the URL: ~~github.com/~~**EcoOnline/code-reviewer**

#### Git CLI
Run `git remote -v`

Take this highlighted part: ~~origin  git@github.com:~~**EcoOnline/code-reviewer**~~.git~~
