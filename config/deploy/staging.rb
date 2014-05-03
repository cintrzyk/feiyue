set :branch, :master
set :stage, :staging
set :deploy_to, '/home/feiyue/staging'

server '188.226.144.35',
  user: 'feiyue',
  roles: %w{web app db},
  ssh_options: {
    forward_agent: true
  }
