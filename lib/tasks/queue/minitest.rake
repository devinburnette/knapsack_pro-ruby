require 'knapsack_pro'

namespace :knapsack_pro do
  namespace :queue do
    task :minitest, [:minitest_args] do |_, args|
      Kernel.system("RAILS_ENV=test RACK_ENV=test #{$PROGRAM_NAME} 'knapsack_pro:queue:minitest_go[#{args[:minitest_args]}]'")
      exitstatus = $?.exitstatus
      if exitstatus.nil?
        puts 'Something went wrong. Most likely process has been killed.'
        Kernel.exit(1)
      else
        Kernel.exit(exitstatus)
      end
    end

    task :minitest_go, [:minitest_args] do |_, args|
      KnapsackPro::Runners::Queue::MinitestRunner.run(args[:minitest_args])
    end
  end
end
