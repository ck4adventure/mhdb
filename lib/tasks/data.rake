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
    # p = File.join(Rails.root, 'db', 'data', 'data.rb')
    # a = []

    dirs = doc.css('div.mouseListView div.mouseListView-categoryDirectory')
    nodes = dirs.pop.css('div.mouseListView-categoryContainer a')

    # nodes = doc.css('div.mouseListView-categoryContainer a')


    nodes.each do |node|
      cat = node.attr('data-category')
      title =  node.attr('title')
      puts title
      g = Group.find_by!(name: title)
      g.update(mh_code: cat)
    end



    # IO.write(p, a.to_s, mode: "a" )

    # Gets Mouse Name, Thumbnail, Group
    # nodes = doc.xpath("//select/option")
    # nodes.each do |node|
    #   # each should be an option
    #   # first option blank
    #   mouse = node.attr("data-type")
    #   group = node.attr("data-category")
    #   thumb = node.attr("data-thumb")
    #   name = node.content.to_s.strip
    #   h = { category: group, mh_name: mouse, name: name, thumb: thumb }
    #   a.push(h)
    # end

    # puts a.length
    # puts a.last


  end

end
