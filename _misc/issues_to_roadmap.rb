#!/usr/bin/env ruby
# encoding: UTF-8

# Converts Issues and Milestones into roadmap.html

require 'net/http'
require 'json'
require 'open-uri'
require 'pp'

response = open("https://api.github.com/repos/twitter/finatra/issues").read

json = JSON.parse(response)

response = open("https://api.github.com/repos/twitter/finatra/issues?state=closed").read

json2 = JSON.parse(response)



# release => [issues]
roadmap = {}

(json + json2).each do |issue|
  if issue["milestone"]
    release = { "title" => issue["milestone"]["title"], "id" => issue["milestone"]["id"] }
    roadmap[release] ||= []
    roadmap[release] << { "title" => issue["title"], "url" => issue["html_url"], "state" => issue["state"] }
  else
    # roadmap["Backlog"] ||= []
    # roadmap["Backlog"] << { "title" => issue["title"], "url" => issue["html_url"], "state" => issue["state"]}
  end
end

File.open("../roadmap.md", "w") do |file|

  file.puts "---"
  file.puts "title: Roadmap"
  file.puts "layout: finatra"
  file.puts "---"

  file.puts '<div class="page-header">'
  file.puts '<h1>Roadmap</h1>'
  file.puts '</div>'

  roadmap.sort_by { |r,i| r["id"].to_i }.reverse.each do |release, issues|
    file.puts "## #{release["title"]}"
    file.puts
    issues.each do |issue|
      if issue["state"] == "closed"
        file.puts "  * [#{issue["title"]}](#{issue["url"]}) ✓"
      else
        file.puts "  * [#{issue["title"]}](#{issue["url"]}) ✗"
      end
    end
    file.puts
  end

end
