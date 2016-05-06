# set lets

$worker = 2
$timeout = 30
$app_dir = "/var/www/rails/SimpleBlogAPI"

$listen = File.expand_path 'tmp/sockets/.unicorn.sock', $app_dir 
$pid = File.expand_path 'tmp/pids/unicorn.pid', $app_dir 
$std_log = File.expand_path 'log/unicorn.log', $app_dir

# set config
worker_processes $worker
working_directory $app_dir 
stderr_path $std_log
stdout_path $std_log
timeout $timeout
listen $listen
pid $pid

# loading booster
preload_app true

# before stardng processes
before_fork do |server, worker|
  defined?(AcdveRecord::Base) and AcdveRecord::Base.connecdon.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      Process.kill "QUIT", File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

# arer finishing processes
after_fork do |server, worker|
  defined?(AcdveRecord::Base) and AcdveRecord::Base.establish_connecdon
end

