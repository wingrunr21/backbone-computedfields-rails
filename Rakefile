require "bundler/gem_tasks"
require 'open-uri'
require 'json'


# Helper Functions
def name
  @name ||= Dir['*.gemspec'].first.split('.').first
end

def version
  line = File.read("lib/#{name}/version.rb")[/^\s*VERSION\s*=\s*.*/]
  line.match(/.*VERSION\s*=\s*['"](.*)['"]/)[1]
end

def latest_tag
  #tags = JSON.parse(open('https://api.github.com/repos/alexanderbeletsky/backbone-computedfields/tags').read)
  #tags.sort!{|a,b| b["name"] <=> a["name"]}
  #tags.first

  # computedfields isn't tagging right now
  # manually specify the version and sha
  # see https://github.com/alexanderbeletsky/backbone-computedfields/issues/16
  tag = {"name"=>"0.0.7", "commit"=>{"sha"=>"master"}}
end

namespace :backbone_computedfields do

  desc "Fetches and displays the latest backbone-computedfields tag"
  task :latest do
    tag = latest_tag
    puts "The latest backbone-computedfields tag is #{tag["name"]} with commit #{tag["commit"]["sha"]}"
  end

  desc "Updates the vendored backbone-computedfields version to the latest tag"
  task :update do
    tag = latest_tag

    # Pull attributes we need
    name = tag["name"]
    sha = tag["commit"]["sha"]

    # Cleanup the name
    name.gsub!(/^v/, '')
    name.gsub!(/-/, '.')

    if name == version
      puts "Gem version #{version} matches the latest backbone-computedfields version #{name}"
      exit
    end

    # Update backbone-computedfields
    puts "Updating backbone-computedfields..."
    base_url = "https://raw.github.com/alexanderbeletsky/backbone-computedfields/#{sha}/lib"
    files = %w{backbone.computedfields.js backbone.computedfields.min.js}
    Dir.chdir './vendor/assets/javascripts' do
      files.each {|file| `curl -O #{base_url}/#{file}`}
    end

    # Update version file
    puts "Updating version.rb..."
    `sed -i "" "s/      VERSION = '.*'/      VERSION = '#{name}'/g" lib/backbone-computedfields-rails/version.rb`
  end
end
