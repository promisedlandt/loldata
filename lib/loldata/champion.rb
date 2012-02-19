module LolData
  class Champion
    def self.parse_official_site
      require 'open-uri'

      champs = {}
      doc = Nokogiri::HTML(open('http://euw.leagueoflegends.com/champions'))
      champions = doc.css("div.champion_list")
      tables = champions.css('table.champion_item')

      tables.each do |table|
        champ = {}

        champ[:riot_image_url] = table.css('td.champion img').first.attributes["src"].value
        champ[:name] = table.css('td.description span.highlight a').first.children.first.text.strip
        champ[:riot_description_short] = table.css('td.description p').text

        if champ[:riot_image_url] =~ /(\d+)\.jpg$/
          champ[:riot_id] = $1.to_i
        end

        champs[champ[:name].downcase] = champ
      end

      champs
    end

    def self.parse_wikia
      require 'open-uri'

      champs = {}
      doc = Nokogiri::HTML(open('http://leagueoflegends.wikia.com/wiki/Base_champion_statistics'))
      table = doc.css('table')[1]
      champion_atts_td = { :health => 1,
                           :health_growth => 2,
                           :health_reg => 3,
                           :health_reg_growth => 4,
                           :mana => 5,
                           :mana_growth => 6,
                           :mana_reg => 7,
                           :mana_reg_growth => 8,
                           :damage => 9,
                           :damage_growth => 10,
                           :atk_speed => 11,
                           :atk_speed_growth => 12,
                           :armor => 13,
                           :armor_growth => 14,
                           :magicres => 15,
                           :magicres_growth => 16,
                           :movement_speed => 17,
                           :attack_range => 18 }

      table.css('tr').each do |row|
        tds = row.css('td')

        unless tds.length == 0
          champ = { :name => row.css('a').first.attributes['title'].value.strip }

          champion_atts_td.each do |att, number|
            champ[att] = tds[number].children.first.text.to_f
          end

          champs[champ[:name].downcase] = champ
        end
      end

      champs
    end

    def self.all
      begin
        champs_1 = parse_official_site
      rescue
        champs_1 = {}
      end

      begin
        champs_2 = parse_wikia
      rescue
        champs_2 = {}
      end

      champs_1.merge(champs_2) { |key, old, new| old.merge new }
    end
  end
end
