# rake deploy:dokku[env]
# Deploy app to Dokku container and notify AppSignal
#
namespace :deploy do
  desc "TODO"
  task :dokku, {[:env] => [:environment]} do |t, args|
    github_push(env: args[:env])
    notify_appsignal(env: args[:env])
  end

  private

  def github_push(env:)
    `git push #{env} master`
  end

  def notify_appsignal(env:)
    puts `APPSIGNAL_PUSH_API_KEY=ENV['APPSIGNAL_PUSH_API_KEY'] appsignal notify_of_deploy --revision=#{timestamp} --user=karim --environment=#{env} --name=Timeliner`
  end

  def timestamp
    Time.now.strftime('%d%m%y%H%M')
  end
end
