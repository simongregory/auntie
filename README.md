# bbc

A ruby gem for acessing [BBC]() data apis

# Install

    git clone <this repo>
    gem build bbc.gemspec
    gem install bbc-0.1.0.gem

# Use

    weather      # lists the weather for the next 24 hours

    tv           # what is on BBC One today
    tv two       # what is on BBC Two today
    tv now       # list of all programmes being broadcast on tv now

    radio        # what is on Radio 1 today
    radio next   # what is on the wireless next
    radio six    # what is on Radio Six Music

# zsh integration

For zsh-shell completion you'll want to create a file called `_radio` with the following contents:

    #compdef radio
    compadd `radio help -c`

and source it via your .zshrc file. The same can be done for the `tv` and `weather`.

# Licence

Please see accompanying LICENSE document.

[BBC]: http://www.bbc.co.uk/