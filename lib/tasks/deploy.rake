# from https://gist.github.com/njvitto/362873

#Deploy and rollback on Heroku in staging and production
task :deploy_staging => ['deploy:set_staging_app', 'deploy:push', 'deploy:restart', 'deploy:tag']
task :deploy_production => ['deploy:set_production_app', 'deploy:push', 'deploy:restart', 'deploy:tag']

task :test_task do
  puts "TESTING!!!"
end
 
namespace :deploy do
  PRODUCTION_APP = 'theodinproject'
  STAGING_APP = '!!!!!YOUR_STAGING_APP_NAME_ON_HEROKU!!!!!'
 
  task :staging_migrations => [:set_staging_app, :push, :off, :migrate, :restart, :on, :tag]
  task :staging_rollback => [:set_staging_app, :off, :push_previous, :restart, :on]
 
  task :production_migrations => [:set_production_app, :push, :off, :migrate, :restart, :on, :tag]
  task :production_rollback => [:set_production_app, :off, :push_previous, :restart, :on]
 
  task :set_staging_app do
    APP = STAGING_APP
  end
 
  task :set_production_app do
    APP = PRODUCTION_APP
  end
 
  task :push do
    puts 'Deploying site to Heroku ...'
    puts `git push -f git@heroku.com:#{APP}.git`
  end
  
  task :restart do
    puts 'Restarting app servers ...'
    puts `heroku restart --app #{APP}`
  end
  
  task :tag do
    release_name = "#{APP}_release-#{Time.now.utc.strftime("%Y%m%d%H%M%S")}"
    puts "Tagging release as '#{release_name}'"
    puts `git tag -a #{release_name} -m 'Tagged release'`
    puts `git push --tags git@heroku.com:#{APP}.git`
  end
  
  task :migrate do
    puts 'Running database migrations ...'
    puts `heroku rake db:migrate --app #{APP}`
  end
  
  task :off do
    puts 'Putting the app into maintenance mode ...'
    puts `heroku maintenance:on --app #{APP}`
  end
  
  task :on do
    puts 'Taking the app out of maintenance mode ...'
    puts `heroku maintenance:off --app #{APP}`
  end
 
  task :push_previous do
    prefix = "#{APP}_release-"
    releases = `git tag`.split("\n").select { |t| t[0..prefix.length-1] == prefix }.sort
    current_release = releases.last
    previous_release = releases[-2] if releases.length >= 2
    if previous_release
      puts "Rolling back to '#{previous_release}' ..."
      
      puts "Checking out '#{previous_release}' in a new branch on local git repo ..."
      puts `git checkout #{previous_release}`
      puts `git checkout -b #{previous_release}`
      
      puts "Removing tagged version '#{previous_release}' (now transformed in branch) ..."
      puts `git tag -d #{previous_release}`
      puts `git push git@heroku.com:#{APP}.git :refs/tags/#{previous_release}`
      
      puts "Pushing '#{previous_release}' to Heroku master ..."
      puts `git push git@heroku.com:#{APP}.git +#{previous_release}:master --force`
      
      puts "Deleting rollbacked release '#{current_release}' ..."
      puts `git tag -d #{current_release}`
      puts `git push git@heroku.com:#{APP}.git :refs/tags/#{current_release}`
      
      puts "Retagging release '#{previous_release}' in case to repeat this process (other rollbacks)..."
      puts `git tag -a #{previous_release} -m 'Tagged release'`
      puts `git push --tags git@heroku.com:#{APP}.git`
      
      puts "Turning local repo checked out on master ..."
      puts `git checkout master`
      puts 'All done!'
    else
      puts "No release tags found - can't roll back!"
      puts releases
    end
  end
end