namespace :db do
  desc "Completely destroy the database, build from scratch and reseed"
  task rebuild: ["db:schema:dump", "db:drop", "db:create", "db:migrate", "db:seed", "erd"] do
  end

end
