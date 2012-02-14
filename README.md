# loldata - Get a list of all the the champions in League of Legends

## Disclaimer

Please note that this gem only scrapes websites, it does not read actual game files. Changes to the web sites' structures can break this gem, and the accuracy of all data derived from this gem depends on the accuracy of the web sites scraped.

---

## Installation

Since this gem is completely unfinished and bad, it's not in the rubygems.org directory yet, so you'll have to install it directly from github:

```ruby
gem 'loldata', :git => 'git://github.com/promisedlandt/loldata.git'
```

### Dependencies

This gem uses the excellent [Nokogiri](http://nokogiri.org/) for the heavy lifting.

---

## Champions

Get a list of all the champions:

```ruby
LolData::Champion.all
```

This returns a hash with a string of the downcased champion names as the keys, and hashes containing the champion data as the values.

The champion data hashes contain the following keys, which should be mostly self explanatory:

 * `:name`: the champion's name (e.g. "Akali")
 * `:riot_image_url`: URL to the official portrait (e.g. "http://euw.leagueoflegends.com/sites/default/files/game_data/1.0.0.133/content/champion/icons/84.jpg")
 * `:riot_description_short`: short description from the official site (e.g. "There exists an ancient order..." etc.)
 * `:health`: champion's starting health (e.g. 450)
 * `:health_growth`: how many hp the champion gets per level (e.g. 85)
 * `:health_reg`
 * `:health_reg_growth`
 * `:mana`
 * `:mana_growth`
 * `:mana_reg`
 * `:mana_reg_growth`
 * `:damage`
 * `:damage_growth`
 * `:atk_speed`
 * `:atk_speed_growth`
 * `:armor`
 * `:armor_growth`
 * `:magicres`
 * `:magicres_growth`
 * `:movement_speed`
 * `:attack_range`

### Sources

1. The offical EUW site will be parsed at http://euw.leagueoflegends.com/champions
2. The League of Legends Wiki will be parsed at http://leagueoflegends.wikia.com/wiki/Base_champion_statistics
