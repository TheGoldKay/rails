require 'open3'

g = """actionmailer (4.2.11.3)
actionpack (4.2.11.3)
actionview (4.2.11.3)
activejob (4.2.11.3)
activemodel (4.2.11.3)
activerecord (4.2.11.3)
activesupport (4.2.11.3)
arel (6.0.4)
ast (2.4.2)
astrolabe (1.3.1)
bigdecimal (1.1.0)
builder (3.2.4)
bundler (1.17.3)
concurrent-ruby (1.1.9)
crass (1.0.6)
erubis (2.7.0)
globalid (0.4.2)
i18n (0.9.5)
io-console (0.3)
json (2.3.0, 1.5.5)
loofah (2.21.1)
mail (2.7.1)
mini_mime (1.1.2)
mini_portile2 (2.1.0)
minitest (5.12.0, 2.5.1)
nokogiri (1.6.8.1)
parser (2.4.0.2)
powerpack (0.1.3)
rack (1.6.13)
rack-test (0.6.3)
rails (4.2.11.3)
rails-deprecated_sanitizer (1.0.4)
rails-dom-testing (1.0.9)
rails-html-sanitizer (1.5.0)
railties (4.2.11.3)
rainbow (2.2.2)
rake (12.2.1, 0.9.2.2)
rdoc (3.9.5)
rubocop (0.34.2)
ruby-progressbar (1.13.0)
sprockets (3.7.2)
sprockets-rails (3.2.2)
thor (0.20.3)
thread_safe (0.3.6)
tzinfo (1.2.11)
"""
all_gems = g.gsub(/\(.*?\)/, "").split(" \n")

def rm gems
    gems.each do |item| 
        stdout, stderr, status = Open3.capture3("gem uninstall #{item}")
        puts stdout
        puts stderr
        puts status.exitstatus
    end
end

rm all_gems