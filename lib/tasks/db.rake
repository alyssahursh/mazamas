namespace :db do
  desc "Completely destroy the database, build from scratch and reseed"

  task :rebuild do
      Rails.env = "development"
      Rake::Task['db:schema:dump'].invoke
      Rake::Task['db:drop'].invoke
      Rake::Task['db:create'].invoke
      Rake::Task['db:migrate'].invoke
      Rake::Task['db:seed'].invoke
      Rake::Task['erd'].invoke
      puts "Rebuilt Development Database"
  end

  task :test do
      Rails.env = "test"
      Rake::Task['db:drop'].invoke
      Rake::Task['db:create'].invoke
      Rake::Task['db:migrate'].invoke
      puts "Rebuilt Test Database"
  end
end
