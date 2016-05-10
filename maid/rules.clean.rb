Maid.rules do

  #
  # Trash
  # Take out the trash first to have the newly trashed files in there
  #

  rule 'Take out the Trash' do
    dir('~/.Trash/*').each do |p|
      remove(p) if accessed_at(p) > 20.days.ago
    end
  end

  #
  # Downloads
  #

  rule 'Trash disk images from ~/Downloads' do
    trash(dir('~/Downloads/*.dmg'))
  end

  rule 'Trash applications in zip files from ~/Downloads' do
    found = dir('~/Downloads/*.zip').select { |path|
      zipfile_contents(path).any? { |c| c.match(/\.app$/) }
    }

    trash(found)
  end

  rule 'Trash duplicate downloads' do
    dupes_in('~/Downloads/*').each do |dupes|
      # Keep the dupe with the shortest filename
      trash dupes.sort_by { |p| File.basename(p).length }[1..-1]
    end
  end

  #
  # Screenshots
  #

  rule 'Delete unused Screenshots' do
    destination = '~/Pictures/Screenshots/old/'
    mkdir(destination)

    dir('~/Pictures/Screenshots/Screen Shot *').each do |path|
      if 1.week.since?(modified_at(path))

        move(path, destination)
      end
    end
  end
end
