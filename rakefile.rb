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

  desc "Serve production Jekyll site locally"
  task :prod do
    puts "Starting up production Jekyll site server..."
    system "bundle exec jekyll serve --host 0.0.0.0 --force_polling"
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

  desc "Regenerate files for production (Windows systems)"
  task :win do
    puts "* Regenerating files for production..."
    system "bundle exec jekyll build"
  end

  desc "Regenerate files for development"
  task :dev do
    puts "* Regenerating files for development..."
    system "bundle exec jekyll build --config _config.yml,_config.dev.yml --profile"
  end

  desc "Regenerate files and drafts for development"
  task :drafts do
    puts "* Regenerating files and drafts for development..."
    system "bundle exec jekyll build --config _config.yml,_config.dev.yml --profile --drafts"
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
