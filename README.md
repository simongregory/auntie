# Auntie

[![Build Status](https://travis-ci.org/simongregory/auntie.png?branch=master)](https://travis-ci.org/simongregory/auntie)

A Ruby Gem for accessing [BBC]() weather, tv, radio, news and sport feeds.

# Install

    gem install auntie

# Use

    weather      # lists the weather for the next 24 hours

    tv           # what is on BBC One today
    tv two       # what is on BBC Two today
    tv now       # list of all programmes being broadcast on tv now

    radio        # what is on Radio 1 today
    radio next   # what is on the wireless next
    radio six    # what is on Radio Six Music
    
    news         # the latest news headlines
    
    sport        # the latest sport headlines

# zsh integration

For zsh-shell completion you'll want to create a file called `_radio` with the following contents:

    #compdef radio
    compadd `radio help -c`

and source it via your .zshrc file. The same can be done for the `tv` and `weather`.

# Licence

[MIT][], see accomanying [LICENSE](LICENSE) document

[BBC]: http://www.bbc.co.uk/
[MIT]: http://opensource.org/licenses/MIT
