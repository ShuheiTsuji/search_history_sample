# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "my_app_name"
set :repo_url, "git@example.com:me/my_repo.git"

set :application, 'search_history_sample'
set :repo_url,  'git@github.com:ShuheiTsuji/search_history_sample.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['/Users/tsuji_shuhei/.ssh/search_history_sample_pair.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
