# frozen_string_literal: true

puts 'Populate movies and reviews with related entities'
Rake::Task['movies:migrate'].invoke
puts 'Done'
