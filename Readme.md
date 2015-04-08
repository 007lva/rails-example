# Buildkite Rails Example

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
brew install sphinx --pgsql --mysql
```
