# frozen_string_literal: true

require "bundler/gem_tasks"
require "minitest/test_task"

Minitest::TestTask.create

require "rubocop/rake_task"

RuboCop::RakeTask.new do |task|
    task.plugins << "rubocop-minitest"
    task.plugins << "rubocop-rake"
end

desc "Run tests and rubocop"
task default: %i[test rubocop]
