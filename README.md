# EcoOnlines implementation for PHP-CS-Fixer

This package takes care of running php-cs-fixer for you whenever committing code.

It utilizes Git's pre-commit feature, and runs php-cs-fixer on the files that have changed.

It will only run when committing code in repositories that are either listed in the official
`whitelist` file, or the custom `whitelist_custom` file.

## Install

```shell
# Clone the repo to your user folder. This is not required, but because the path to this
# location is stored in your pre-commit file, it cannot change with time.
cd ~/ && git clone git@github.com:EcoOnline/php-styles.git
 
# Install php-cs-fixer
composer install

# Activate php-cs-fixer
./install.sh
```

## Whitelist

After running `install.sh`, there will be a file called `whitelist_custom` in the root of this directory. Feel free to add any remote to this file, and php-cs-fixer
will run when committing code in those projects.

There's currently no support for running this on projects that have no GIT remote. Feel free
to add whitelist support for paths as well.

### Adding to the whitelist

Any repository owner can add their repositories to the main whitelist file.

Follow the same syntax as the previous entries. 

#### GitHub URL
Take this highlighted part from the URL: ~~github.com/~~**EcoOnline/php-styles**

#### Git CLI
Run `git remote -v`

Take this highlighted part: ~~origin  git@github.com:~~**EcoOnline/php-styles**~~.git~~
