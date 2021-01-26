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

  task parse: :environment do
    # access the file and parse it into a doc
    # query the doc for certain class names or patterns
    # try to get it to print out just the info we need
    # then get it to put that info to an entire file
    path = File.join(Rails.root, 'db', 'data', 'test.html')
    puts path
    doc = Nokogiri::HTML(IO.read(path))
    p = File.join(Rails.root, 'db', 'data', 'mouse_data.rb')



    # Gets Mouse Name, Thumbnail, Group
    # need lg image link, gold and points
    nodes = doc.xpath("//select/option")
    nodes.each do |node|
      # each should be an option
      # first option blank
      mouse = node.attr("data-type")
      group = node.attr("data-category")
      thumb = node.attr("data-thumb")
      mh_title = node.content.to_s.strip.split(" ")
  
      h = { category: group, mh_name: mouse, name: name, thumb: thumb }
      a.push(h)
    # end

    # puts a.length
    # puts a.last


  end

  # Task data:groups will write a file that has the group name and code
  task get_groups: :environment do
    # This will grab the html data
    path = File.join(Rails.root, 'db', 'data', 'test.html')
    puts path
    doc = Nokogiri::HTML(IO.read(path))

    # Create a new file, and an array to hold the data to pass in
    p = File.join(Rails.root, 'db', 'data', 'group_data.rb')
    a = []


    # This will scrape the html file for all the group names and add the mh_code to groups
    # Group items have a name and a mh_code
    dirs = doc.css('div.mouseListView div.mouseListView-categoryDirectory')
    nodes = dirs.pop.css('div.mouseListView-categoryContainer a')
    nodes.each do |node|
      mh_code = node.attr('data-category')
      name =  node.attr('title')
      puts name
      h = { mh_code: mh_code, name: name }
      a.push(h)
    end


    # File write code to append data
    # Write a new one each time we run this
    IO.write(p, a.to_s, mode: "w" )
  end

end
