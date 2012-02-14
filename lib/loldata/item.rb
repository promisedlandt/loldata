module LolData
  class Item
    def self.parse_official_site
      require 'open-uri'

      doc = Nokogiri::HTML(open('http://euw.leagueoflegends.com/items'))
      tables = doc.css('table.champion_item')
      #item_attribute_separators = ['\+', 'UNIQUE Aura: ', 'UNIQUE Active: ', 'UNIQUE Passive: ', 'Active: ', 'Passive: ']
      #item_split_regexp = Regexp.new "(#{ item_attribute_separators.join '|' })"
      items = []

      tables.each do |table|
        item = { :attributes => [], :name => table.css('td.description span.highlight').children.first.to_s }

        img_url = table.css("td.item_icon img").first.attributes["src"].value
        item[:riot_image_url] = img_url

        if img_url =~ /(\d+)\.png$/
          item[:riot_id] = $1.to_i
        end

        desc = table.css('td.description p').first.children.first.to_s.strip
        item[:riot_description] = desc

        #atts = desc.split(item_split_regexp).reject { |s| s.empty? }

        #last_delimiter = ''

        #atts.each do |a|
          #if item_attribute_separators.include?(a) or item_attribute_separators.include?("\\#{ a }")
            #last_delimiter = a
          #elsif a =~ /^(\d+%?) (\D+)$/
            #item[:attributes] << { $2.strip => last_delimiter + $1.strip }
          #else
            #item[:attributes] << last_delimiter + a.strip
          #end
        #end

        items << item
      end

      items
    end

    def self.all
      begin
        items = parse_official_site
      rescue
        items = {}
      end

      items
    end
  end
end
