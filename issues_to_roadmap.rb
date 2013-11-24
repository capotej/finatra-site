#!/usr/bin/env ruby

# Converts Issues and Milestones into roadmap.html

require 'net/http'
require 'json'
require 'open-uri'
require 'pp'

response = open("https://api.github.com/repos/twitter/finatra/issues?state=open").read

json = JSON.parse(response)

# release => [issues]
roadmap = {}

json.reverse.each do |issue|
  if issue["milestone"]
    release = issue["milestone"]["title"]
    roadmap[release] ||= []
    roadmap[release] << { "title" => issue["title"], "url" => issue["url"] }
  else
    roadmap["Backlog"] ||= []
    roadmap["Backlog"] << { "title" => issue["title"], "url" => issue["url"] }
  end
end

File.open("content/roadmap.md", "w") do |file|

  file.puts "---"
  file.puts "title: Roadmap"
  file.puts "---"

  file.puts '<div class="page-header">'
  file.puts '<h1>Roadmap</h1>'
  file.puts '</div>'

  roadmap.each do |release, issues|
    file.puts "## #{release}"
    file.puts
    issues.each do |issue|
      file.puts "  * [#{issue["title"]}](#{issue["url"]})"
    end
    file.puts
  end

end
