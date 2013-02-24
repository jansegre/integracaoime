require "rvm/capistrano"
require "bundler/capistrano"

set :application, "integracaoime"
set :repository, "."

set :user, "capistrano"
set :deploy_via, :copy
set :deploy_to, "/var/www/rails/#{application}"
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm, :git
set :copy_cache, true

role :app, "integracao.segre.in", primary: true
role :web, "integracao.segre.in"                          # Your HTTP server, Apache/etc
#role :db,  "integracao.segre.in", :primary => true # This is where Rails migrations will run
#role :db,  "integracao.segre.in"

#set :rake, "/usr/local/bin/rake"
#set :bundle, "/usr/local/bin/bundle"

#set :default_environment, {
#  'RUBY_VERSION' => 'ruby 1.9.3'
#}

# include uploads dir
set :shared_children, shared_children + %w(public/uploads)

#before 'deploy:setup', 'rvm:install_rvm'
#before 'deploy:setup', 'rvm:install_ruby'

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

namespace :app do
  for action in [:start, :stop, :restart, :reload]
    task action do
      run "#{try_sudo} /etc/init.d/unicorn.#{application} #{action}"
    end
  end
  task :reprocess_images do
    run "cd #{deploy_to}/current && bundle exec rake cw:recreate_versions"
  end
  task :db_seed do
    run "cd #{deploy_to}/current && bundle exec rake db:seed"
  end
end

after 'deploy:restart', 'app:reload'

