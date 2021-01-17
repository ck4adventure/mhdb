namespace :data do
  desc "TODO"

  # this will seed entire database from fresh
  task seed_all: :environment do
    # Taken from article, should run all files in 'seeds' folder in alphanumeric order
    # Leave the sort in else you can't control the order of the files


    Dir[File.join(Rails.root, 'db', 'seeds/setup', '*.rb')].sort.each do |seed|
      load seed
    end

    # intentionally leaving out loose files not in subfolders of /seeds
    # Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
    #   load seed
    # end
    # Code to get to a subfolder below `seeds`
    Dir[File.join(Rails.root, 'db', 'seeds/regionlocations', '*.rb')].sort.each do |seed|
      load seed
    end

    Dir[File.join(Rails.root, 'db', 'seeds/mice', '*.rb')].sort.each do |seed|
      load seed
    end

    Dir[File.join(Rails.root, 'db', 'seeds/mouselocations', '*.rb')].sort.each do |seed|
      load seed
    end
  end

  # seed only takes the files you are currently working on
  task seed: :environment do
       Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
      load seed
    end
  end

end
