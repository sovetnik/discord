# frozen_string_literal: true
# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'discordian'
set :scm, :git
set :repo_url, 'git@github.com:sovetnik/discordian.git'
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
set :branch, 'abilities'

set :deploy_to, '/var/www/discordian'
set :deploy_user, 'doppler'

set :rails_env, :production
set :deploy_via, :remote_cache

set :rvm_ruby_string, :local
set :rvm_autolibs_flag, 'read-only'

set :keep_releases, 5

set :log_level, :debug

set :linked_files, fetch(:linked_files, []).push('.env')

set :linked_dirs, fetch(:linked_dirs, []).push('log',
                                               'tmp/pids',
                                               'tmp/cache',
                                               'tmp/sockets',
                                               'vendor/bundle',
                                               'public/system',
                                               'public/uploads')

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # execute :touch, release_path.join('tmp/restart.txt')
      invoke 'unicorn:restart'
    end
  end
  after :publishing, :restart
end
