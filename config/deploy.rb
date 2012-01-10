set :application, "YAYO.com"
set :repository,  "git@github.com:andreabat/yayo.com.git"

set :scm, :git
set :user,"yayo"
set :scm_passphrase, "731812!"  # The deploy user's password
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "ssh.railscluster.nl"                          # Your HTTP server, Apache/etc
 #role :db,  "your slave db-server here"
set :git_enable_submodules, 1
set :deploy_to, "/home/yayo/web_root/releases"
# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

set :user, 'yayo'
ssh_options[:port] = 2222
ssh_options[:verbose] = :debug
ssh_options[:username] = 'yayo'
ssh_options[:host_key] = 'ssh-dss'
ssh_options[:keys] = "`/.ssh/"
ssh_options[:paranoid] = false

 
