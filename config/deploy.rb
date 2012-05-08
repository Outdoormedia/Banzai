require 'rvm/capistrano'
require 'capistrano_colors'

# General
set :application, "banzai"
set :user, application
# Repository
set :repository, "git@github.com:brisbanerails/banzai.git"
set :scm, :git
# SSH
set :custom_ssh_keys, "~/.ssh/vlc_id_dsa"
# Server
server "banzai-prep.moveoutdoor.com.au", :web, :app, :db, primary: true
set :deploy_to, "/home/banzai"
set :rvm_ruby_string, '1.9.3-p125'

ssh_options[:keys] = custom_ssh_keys
#ssh_options[:forward_agent] = true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
   #run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  after "deploy:setup", "deploy:setup_ownership"
  after "deploy:setup", "deploy:create_shared"

  task :setup_ownership do
    run "#{try_sudo} chown -R #{user}:#{user} releases"
    run "#{try_sudo} chown -R #{user}:#{user} shared"
  end

  task :create_shared_database_yml do

  end

  task :migrate do
    run "cd current; rake db:migrate"
  end

  task "bundle" do
    run "cd #{current_path}; bundle install"
  end

  task "create_database" do
    run "cd #{current_path}; rake db:create"
  end

  task :seed_database do
    run "cd #{current_path}; rake db:seed"
  end

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{current_path}/config/database.yml"
  end
end

after "deploy", "deploy:symlink_config"


task :rvm_version do
  run "which ruby"
end


