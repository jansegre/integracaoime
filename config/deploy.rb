require "rvm/capistrano"
require "bundler/capistrano"

set :application, "integracaoime"
set :repository, "."

set :deploy_via, :copy
set :deploy_to, "/var/www/rails/#{application}"
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm, :git
set :copy_cache, true

role :web, "integracao.segre.in"                          # Your HTTP server, Apache/etc
role :app, "integracao.segre.in"                          # This may be the same as your `Web` server
role :db,  "integracao.segre.in", :primary => true # This is where Rails migrations will run
role :db,  "integracao.segre.in"

set :rake, "/usr/local/bin/rake"
set :bundle, "/usr/local/bin/bundle"

set :default_environment, {
  'RUBY_VERSION' => 'ruby 1.9.3'
}

before 'deploy:setup', 'rvm:install_rvm'
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

#after 'deploy:restart', 'unicorn:reload' # app IS NOT preloaded
after 'deploy:restart', 'unicorn:restart' # app preloaded

