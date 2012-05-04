require "bundler/capistrano"
require "rockin/capistrano"

server "<%= ip %>", :web, :app, :db, primary: true

set :user, "deployer"
set :application, "<%= application %>"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :scm, "git"
set :repository, "<%= git_url %>"
set :branch, "master"
set :domain, "#{application}.com"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases
