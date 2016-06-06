# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'discordian'
set :repo_url, 'git@github.com:sovetnik/discordian.git'
set :branch, 'master'

set :deploy_to, '/var/www/discordian'
set :deploy_user, 'doppler'

set :log_level, :debug

set :linked_files, fetch(:linked_files, []).push('config/database.yml', '.env')

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
