# Auntie

[![Build Status](https://travis-ci.org/simongregory/auntie.png?branch=master)](https://travis-ci.org/simongregory/auntie)
[![Code Climate](https://codeclimate.com/github/simongregory/auntie.png)](https://codeclimate.com/github/simongregory/auntie)
[![Dependency Status](https://gemnasium.com/simongregory/auntie.png)](https://gemnasium.com/simongregory/auntie)

A Ruby Gem for accessing [BBC]() Weather, TV, Radio, News and Sport feeds.

## Install

    gem install auntie

## Use

    weather      # lists the weather for the next 24 hours

    tv           # what is on BBC One today
    tv two       # what is on BBC Two today
    tv now       # list of all programmes being broadcast on tv now

    radio        # what is on Radio 1 today
    radio next   # what is on the wireless next
    radio six    # what is on Radio Six Music
    
    news         # the latest news headlines
    
    sport        # the latest sport headlines

## zsh integration

[zsh][] shell completion can be added to the `tv`, `radio` and `weather` tools. Radio, for example, can be enabled by creating a file called `_radio` with the following contents:

    #compdef radio
    compadd `radio help -c`

and source it via your .zshrc file.

## Licence

[MIT][], see accomanying [LICENSE](LICENSE) document

[BBC]: http://www.bbc.co.uk/
[MIT]: http://opensource.org/licenses/MIT
[zsh]: http://zsh.sourceforge.net
