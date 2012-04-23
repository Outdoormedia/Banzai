# General
set :application, "bonzai"
set :user, "bonzai"
# Repository
set :repository,  "git@github.com:brisbanerails/bonzai.git"
set :scm, :git
# SSH
set :custom_ssh_keys, "~/.ssh/vlc_id_dsa"
# Server
server "ec2-107-20-117-68.compute-1.amazonaws.com", :web, :app, :db, primary: true



ssh_options[:keys] = custom_ssh_keys


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
end