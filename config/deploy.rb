require "bundler/capistrano"
require "rvm/capistrano"

load "config/recipes/base"
load "config/recipes/node"
load "config/recipes/nginx_puma"
load "config/recipes/puma"
load "config/recipes/mysql"
load "config/recipes/rvm"

server "rubydev.fr", :web, :app, :db, :primary => true

set :site_url, "rubydev.fr"
set :application, "rubydev"
set :user, "olivierdoe"

set :deploy_to, "/home/#{user}/apps/#{application}"
set :use_sudo, false

set :scm, "git"
set :repository,  "https://github.com/oducroux/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true


after "deploy", "deploy:cleanup" # keep only the last 5 releases

