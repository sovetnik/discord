# frozen_string_literal: true
server 'aero.media', user: 'doppler', roles: %w(app db web), primary: true

set :ssh_options, keys: %w(~/.ssh/id_rsa),
                  forward_agent: true,
                  auth_methods: %w(publickey password),
                  port: 2231
