Eye on Buzz
===========

[![Build Status](https://www.bitrise.io/app/fe75dff0a1e3c5e6/status.svg?token=Z6DPEOcTySfr5RM2tSPBWQ&branch=development)](https://www.bitrise.io/app/fe75dff0a1e3c5e6)

iOS app to check out upcoming movies using [The Movie Database (TMDb) API v3](https://developers.themoviedb.org/3/).

## Setup

### Carthage

This project uses [carthage](https://github.com/Carthage/Carthage) as a dependency manager. To install it with [Homebrew](https://github.com/Homebrew/brew) you can install it:

```
brew install carthage
```

### Installing Dependencies

First install dependencies with `Carthage` command:

```
carthage bootstrap --platform ios
```

This will check out and build project's dependencies.

### Project Settings

Run `bootstrap` command to copy project files, then fill it with your keys:

```
./scripts/bootstrap
```

### Configure Credentials

To avoid setting API key publicly you can use this script to setup API key properly:

```
THEMOVIEDB_API_KEY=your-tmdb-api-key ./scripts/setup_credentials
```

This will replace placeholder key by actual key value in `Credentials.plist` (if you want you can replace it also manually).

## Pending

Future tasks that I plan to work on:

* Fetch both endpoints (UpcomingMovies and Genre List) simultaneously
* Fallback to backdrop image if poster is absent
* Show a default poster image if movie does not have backdrop or poster image
* Hide backdrop image from Upcoming Movie screen if absent
* Ignore unknown genres (that may be included after fetch genres from Genres endpoint)
* Implement search feature
* Get image sizes according with device resolution, with a proper resolution, dynamically
* Implement more unit tests
* Implement acceptance tests (user interface based)
