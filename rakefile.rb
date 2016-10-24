# Thanks to https://github.com/mmistakes
# Inspired by: https://github.com/mmistakes/made-mistakes-jekyll/blob/10.2.0/Rakefile.rb

##############
# Jekyll tasks
##############

# Usage: rake serve, rake serve:prod
task :serve => ["serve:dev"]
namespace :serve do

  desc "Serve development Jekyll site locally"
  task :dev do
    puts "Starting up development Jekyll site server..."
    system "bundle exec jekyll serve --config _config.yml,_config.dev.yml --host 0.0.0.0 --force_polling"
  end

  desc "Serve development Jekyll site locally with drafts"
  task :drafts do
    puts "Starting up development Jekyll site server with drafts..."
    system "bundle exec jekyll serve --config _config.yml,_config.dev.yml --host 0.0.0.0 --force_polling --drafts"
  end
end

# Usage: rake build, rake build:dev, rake build:drafts
task :build => ["build:prod"]
namespace :build do

  desc "Regenerate files for production"
  task :prod do
    puts "* Regenerating files for production..."
    system "JEKYLL_ENV=production bundle exec jekyll build"
  end

  desc "Regenerate files for development"
  task :dev do
    puts "* Regenerating files for development..."
    system "bundle exec jekyll build --profile"
  end

  desc "Regenerate files and drafts for development"
  task :drafts do
    puts "* Regenerating files and drafts for development..."
    system "bundle exec jekyll build  --profile --drafts"
  end
end

####################
# Notification tasks
####################

# Usage: rake notify
task :notify => ["notify:pingomatic", "notify:google", "notify:bing"]
desc "Notify various services that the site has been updated"
namespace :notify do

  desc "Notify Ping-O-Matic"
  task :pingomatic do
    begin
      require 'xmlrpc/client'
      puts "* Notifying Ping-O-Matic that the site has updated"
      XMLRPC::Client.new('rpc.pingomatic.com', '/').call('weblogUpdates.extendedPing', 'oncleben31.cc' , 'http://oncleben31.cc', 'http://oncleben31.cc/feed.xml')
    rescue LoadError
      puts "! Could not ping ping-o-matic, because XMLRPC::Client could not be found."
    end
  end

  desc "Notify Google of updated sitemap"
  task :google do
    begin
      require 'net/http'
      require 'uri'
      puts "* Notifying Google that the site has updated"
      Net::HTTP.get('www.google.com', '/webmasters/tools/ping?sitemap=' + URI.escape('http://oncleben31.cc/sitemap.xml'))
    rescue LoadError
      puts "! Could not ping Google about our sitemap, because Net::HTTP or URI could not be found."
    end
  end

  desc "Notify Bing of updated sitemap"
  task :bing do
    begin
      require 'net/http'
      require 'uri'
      puts '* Notifying Bing that the site has updated'
      Net::HTTP.get('www.bing.com', '/webmaster/ping.aspx?siteMap=' + URI.escape('http://onlceben31.cc/sitemap.xml'))
    rescue LoadError
      puts "! Could not ping Bing about our sitemap, because Net::HTTP or URI could not be found."
    end
  end
end


##############
# CI tasks
##############
# Usage: rake htmlproofer
desc "htmlproofer on the contents of ./_site"
task :htmlproofer do
  puts "htmlproofer on the contents of ./_site"
  system "bundle exec htmlproofer ./_site"
end
