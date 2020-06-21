# icloud-export

iCloud Export exports iCloud tab titles and urls to TSV.

## Requirements

* sqlite3

## Installation

* Clone this repository
* Optionally: use `--alias` to generate a nice alias for your `~/.profile` or equivalent:

```
$ icloud-export.sh --alias
alias icloud-export="/Users/jerry/icloud-export/icloud-export.sh"
$ icloud-export.sh --alias >> ~/.profile
$
```

## Example

```
$ ./icloud-export.sh tabs | head -n 5
What I Learned Co-Founding Dribbble - Dribbble - Medium	https://medium.com/dribbble/what-i-learned-co-founding-dribbble-8680f6816e3d
The French Army is hiring science fiction writers to imagine future threats - The Verge	https://www.theverge.com/platform/amp/2019/7/24/20708432/france-military-science-fiction-writers-red-team?__twitter_impression=true
The Rise of ‘Mama’	https://longreads.com/2015/05/10/the-rise-of-mama/amp/?__twitter_impression=true
2014 Major League Baseball draft - Wikipedia	https://en.m.wikipedia.org/wiki/2014_Major_League_Baseball_draft
The Case for the Mid-at-bat Pitching Change - The Ringer	https://www.theringer.com/mlb/2019/7/26/8931272/mid-plate-appearance-pitcher-change-john-cohen-mississippi-state-kentucky
```

## Usage

```
Usage: /Users/cicero/gh/icloud-export/icloud-export.sh [<flags>] <section>
Flags:
  --alias       - Generate alias
  -h, --help    - This help
  -V, --version - Version Info
Available sections:
  tabs          - iCloud tabs
```

## Future Work

* Other output formats: CSV, webloc
* Other sections: bookmarks

## License

[BSD](LICENSE)
