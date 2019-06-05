# Gomematic: Homebrew

[![Build Status](http://drone.gomematic.tech/api/badges/gomematic/homebrew-gomematic/status.svg)](http://drone.gomematic.tech/gomematic/homebrew-gomematic)
[![Stories in Ready](https://badge.waffle.io/gomematic/gomematic-api.svg?label=ready&title=Ready)](http://waffle.io/gomematic/gomematic-api)
[![Join the Matrix chat at https://matrix.to/#/#gomematic:matrix.org](https://img.shields.io/badge/matrix-%23gomematic%3Amatrix.org-7bc9a4.svg)](https://matrix.to/#/#gomematic:matrix.org)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/1c9e07db702546e4a9199eb6b961f20f)](https://www.codacy.com/app/gomematic/homebrew-gomematic?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=gomematic/homebrew-gomematic&amp;utm_campaign=Badge_Grade)

**This project is under heavy development, it's not in a working state yet!**

Homebrew repository to install [Gomematic](https://gomematic.tech) on macOS.


## Prepare

```bash
brew tap gomematic/gomematic
```


## Install

### gomematic-cli

```bash
brew install gomematic-cli
gomematic-cli -h
```


## Development

```
bundle install
bundle exec rake rubocop
bundle exec rake spec
```


## Security

If you find a security issue please contact gomematic@webhippie.de first.


## Contributing

Fork -> Patch -> Push -> Pull Request


## Authors

* [Thomas Boerger](https://github.com/tboerger)


## License

Apache-2.0


## Copyright

```
Copyright (c) 2018 Thomas Boerger <thomas@webhippie.de>
```
