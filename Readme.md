# Buildkite Rails Example

[![Build status](https://badge.buildkite.com/5de65f90934634838d4badeefd01d0adde86092918b4ba3ad4.svg)](https://buildkite.com/buildkite/rails-example)

Use this as a guide on how to test Rails applications on Buildkite

## Databases

Set with `DATABASE_ADAPTER`

```
postgres
mysql
```

## Capybara Drivers

Set with `CAPYBARA_DRIVER`

```
firefox
chrome
poltergeist
webkit
```

### Note about Google Chrome

When spinning up Google Chrome, you need to make sure the `--no-sandbox` argument is passed, otherwise it won't work.

## Installation (OSX)

```bash
brew install postgres mysql
```
