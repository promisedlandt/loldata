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
 * `:riot_id`: an integer Riot supposedly uses to uniquely identify the champions (e.g. 84)
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

1. The official EUW site will be parsed at http://euw.leagueoflegends.com/champions
2. The League of Legends Wiki will be parsed at http://leagueoflegends.wikia.com/wiki/Base_champion_statistics

---

## Items

Get a list of all the items:

```ruby
LolData::Item.all
```

This returns an array of hashes containing the item data.

The item data hashes contain the following keys:

 * `:name`: the item's name (e.g. "Abyssal Scepter")
 * `:riot_image_url`: URL to the official item picture (e.g. "http://euw.leagueoflegends.com/sites/default/files/game_data/1.0.0.133/content/item/3001.png")
 * `:riot_id`: an integer Riot supposedly uses to uniquely identify the items (e.g. 3001)
 * `:riot_description`: description from the official site, includes all the stats, actives, passives (e.g. "+70 Ability Power +57 Magic Resist  UNIQUE Aura: Reduces the Magic Resist of nearby enemy champions by 20.")

### Sources
1. The official EUW site will be parsed at http://euw.leagueoflegends.com/items

---

## Todo
 * Parse champion detail pages on official site so we don't need to parse wikia
 * Split item attributes so we don't just return the string
 * Figure out how to write specs for a gem that only scrapes other pages
 * Better error handling
