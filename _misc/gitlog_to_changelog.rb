#!/usr/bin/env ruby

# ### example input
# 28d3b88 - (HEAD, origin/master, master) docs for 1.5.3 (19 minutes ago) <Julio Capote>
# f348151 - prepare for 1.5.3 release (21 minutes ago) <Julio Capote>
# 5be0cbd - (tw_server161) decouple errorHandling from AppService due to App/Service trait conflict (36 minutes ago) <Julio Capote>
# 330ea28 - update to finagle 13.1, twitter-server 1.6.1 (37 minutes ago) <Julio Capote>

#### example output
# [f5c52b](https://github.com/twitter/finatra/commit/f5c52b28d9d6ca20b26b6dac5a964ae90cda45a0) Fixed bug in multipart form uploads that contain both text and file fields.


input = ARGF.read

puts

input.lines.each do |line|
  sha, msg = line.split(/(^[a-z0-9]{7}) - /).select { |x| !x.empty? }.map(&:chomp)
  puts '<p class="lead">'
  puts "[#{sha}](https://github.com/twitter/finatra/commit/#{sha}) #{msg}"
  puts
end
