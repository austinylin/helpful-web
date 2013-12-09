if defined?(MiniTest)
  %w(workers serializers).each do |task|
    MiniTest::Rails::Testing.default_tasks << task
  end
end

namespace :test do
  task :simplecov => :environment do
    ENV['COVERAGE'] = 'true'
    Rake::Task["test:all"].execute
  end
end
