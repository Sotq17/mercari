require 'mechanize'

class Scraping
	def self.genre
		username = 'admin'
		password = '2222'
		agent = Mechanize.new do |agent|
			agent.pre_connect_hooks << lambda { |agent, request| request["Authorization"] = "Basic #{Base64.strict_encode64(username + ':' + password)}" }
		end
		genres = []
    page = agent.get("https://www.freemarket46nagoya.com/items/all_categories_show")
		elements = page.search('.category-lists-box__root-category-name.font-white.red h3') # a要素の下のdiv要素を検索
		elements.each do |ele|
		genres	<< {name: "#{ele.inner_text.strip}"}
		end
		puts genres.inspect
	end

	def self.subgenre
		username = 'admin'
		password = '2222'
		agent = Mechanize.new do |agent|
			agent.pre_connect_hooks << lambda { |agent, request| request["Authorization"] = "Basic #{Base64.strict_encode64(username + ':' + password)}" }
		end
		subgenres = []
    page = agent.get("https://www.freemarket46nagoya.com/items/all_categories_show")
		elements = page.search('h4') # a要素の下のdiv要素を検索
		elements.each do |ele|
		subgenres	<< {name: "#{ele.inner_text.strip}"}
		end
		puts subgenres.inspect
	end

	def self.details
		username = 'admin'
		password = '2222'
		agent = Mechanize.new do |agent|
			agent.pre_connect_hooks << lambda { |agent, request| request["Authorization"] = "Basic #{Base64.strict_encode64(username + ':' + password)}" }
		end
		details = []
    page = agent.get("https://www.freemarket46nagoya.com/items/all_categories_show")
		elements = page.search('.grand-child-category-box__grand-child-category-name p a') # a要素の下のdiv要素を検索
		elements.each do |ele|
		details	<< {name: "#{ele.inner_text.strip}"}
		end
		puts details.inspect
	end
end
