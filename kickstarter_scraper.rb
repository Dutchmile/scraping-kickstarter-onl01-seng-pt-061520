# require libraries/modules here
require "nokogiri"
require 'pry'
def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  projects = {}
  project = kickstarter.css("li.project.grid_4")
  project.each do |project|
    projects[project] = {}
  end
  project
end

create_project_hash

# project: kickstarter.css("li.project.grid_4")
# title: project.css("h2.bbcard_name strong a").text
# image link: project.css("div.project-thumbnail a img").attribute("src").value
# description: project.css("p.bbcard_blurb").text
# location project.css("ul.project-meta li a span.location-name").text
# Percent funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
