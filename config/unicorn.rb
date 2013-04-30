# -*- encoding : utf-8 -*-
root = "/home/deployer/apps/geoprojeto/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.geoprojeto.sock"
worker_processes 2
timeout 300
