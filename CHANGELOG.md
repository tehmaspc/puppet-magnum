## [4.1.0]

### IMPROVEMENTS:
  * Updated gem versions
  * Improved and streamlined beaker workflows with Virtualbox and Docker
  * Updated defaults for better CI workflows
  * Updated SUTs with more current settings

## [4.0.4]

### FIXES:

* Fix spec test naming.

## [4.0.3]

### FIXES:

  * Reintro .fixtures.yml support since Beaker doesn't support private git repos properly.

### IMPROVEMENTS:

  * Update gem versions.

## [4.0.2]

### IMPROVEMENTS:

  * Added a function to remove any unused files and directories in `puppet-magnum` 4.x.
    This will make upgrading PM repos from 3.x to 4.x easier.
    A `module init` using `puppet-magnum` 4.x will remove/rename the following files:
      - .fixtures.yml (removed)
      - .vagrant_puppet/ (removed)
      - Vagrantfile (removed)
      - spec => spec.old (renamed)
      - serverspec => serverspec.old (renamed)
    * In `puppet-magnum` 4.x - `.puppet-magnum.init` is now `.puppet-magnum` and it is in YAML format.

## [4.0.1]

### IMPROVEMENTS:

  * Minor code cleanup.

## [4.0.0]

### IMPROVEMENTS:

  * Upgrading to use Ruby `2.4.x` by default.
  * Switching over to [Beaker](https://github.com/puppetlabs/beaker) for acceptance/integration testing. All tests are now through Beaker.
  * Adding `hiera` v5 support; more [details](https://docs.puppet.com/puppet/4.10/hiera_migrate_modules.html).
  * `puppet-magnum` 4.x is NOT backwards compatible with `puppet-magnum` 3.x managed repos.

## [3.1.5]

### IMPROVEMENTS:

  * Upgraded all Puppet gems; tested with Ruby 2.3.3.
  * Removed unnecessary `colorize` and `redcarpet` gems.

## [3.1.3]

### FIXES:

  * Fix puppet-lint linenumber config change in Rakefile.

### IMPROVEMENTS:

  * Upgraded all Puppet gems; tested with Ruby 2.3.3.

## [3.1.2]

### IMPROVEMENTS:

  * Upgraded all Puppet gems; tested with Ruby 2.3.3.

## [3.1.1]

### IMPROVEMENTS:

  * Upgraded all Puppet gems; tested with Ruby 2.3.3.

## [3.1.0]

### IMPROVEMENTS:

  * Upgraded all Puppet gems; tested with Ruby 2.3.1.
  * Vagrant init.sh script installs latest `puppet-agent` on test VM.
  * Silenced Vagrant init.sh script output.

## [3.0.12]

### IMPROVEMENTS:

  * Add back an `integ` Rake task to automatically run Vagrant. This task runs `spec_prep` Rake task prior to running Vagrant.

## [3.0.11]

### IMPROVEMENTS:

  * Upgrade to `puppet-lint` 2.0.0.

## [3.0.10]

### FIXES:

  * Use `https://apt.puppetlabs.com/pubkey.gpg` for puppetlabs GPG key; fixes puppetlabs' ubuntu vagrant box.

## [3.0.9]

### IMPROVEMENTS:

  * Switch to `https` for rubygems.org in the Gemfile template.

## [3.0.8]

### IMPROVEMENTS:

  * Updated `puppet` gem in Gemfile to 4.5.1.

## [3.0.6]

## [3.0.5]

## [3.0.4]

### IMPROVEMENTS:

  * Adding `vagrant-cachier` support in Vagrantfile.

## [3.0.3]

## [3.0.2]

## [3.0.1]

## [3.0.0]

### FEATURES:

  * Upgraded to support Puppet 4+.
