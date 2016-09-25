##############
# Jekyll tasks
##############
# Thanks to https://github.com/mmistakes
# Inspired by: https://github.com/mmistakes/made-mistakes-jekyll/blob/10.2.0/Rakefile.rb

# Usage: rake serve, rake serve:prod
task :serve => ["serve:dev"]
namespace :serve do

  desc "Serve development Jekyll site locally"
  task :dev do
    puts "Starting up development Jekyll site server..."
    system "bundle exec jekyll serve --host 0.0.0.0 --config _config.yml,_config_dev.yml --force_polling"
  end

  desc "Serve production Jekyll site locally"
  task :prod do
    puts "Starting up production Jekyll site server..."
    system "bundle exec jekyll serve --host 0.0.0.0 --force_polling"
  end
end
