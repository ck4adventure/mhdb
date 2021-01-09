namespace :data do
  desc "TODO"
  task seed: :environment do
    # Taken from article, should run all files in 'seeds' folder in alphanumeric order
    # Leave the sort in else you can't control the order of the files
    Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
      load seed
    end
    # Code to get to a subfolder below `seeds`
    Dir[File.join(Rails.root, 'db', 'seeds/groups', '*.rb')].sort.each do |seed|
      load seed
    end

    Dir[File.join(Rails.root, 'db', 'seeds/regions', '*.rb')].sort.each do |seed|
      load seed
    end
  end

end
