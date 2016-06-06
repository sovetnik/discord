server 'aero.media', user: 'doppler', roles: %w{app db web}, primary: true

role :app, %w{doppler@aero.media}
role :web, %w{doppler@aero.media}
role :db,  %w{doppler@aero.media}

set :rails_env, :production

set :ssh_options, {
  keys: %w(~/.ssh/id_rsa),
  forward_agent: true,
  auth_methods: %w(publickey password),
  port: 2231
}
