Bundler.require(:default, :test)

require_relative '../config/application'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run_when_matching :focus

  config.order = :random
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end

  config.around(:each) do |example|
    DB.transaction(rollback: :always, auto_savepoint: true){ example.run }
  end
end
