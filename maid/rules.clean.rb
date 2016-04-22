Maid.rules do

  rule 'Delete disk images from ~/Downloads' do
    trash(dir('~/Downloads/*.dmg'))
  end

  rule 'Delete applications in zip files from ~/Downloads' do
    found = dir('~/Downloads/*.zip').select { |path|
      zipfile_contents(path).any? { |c| c.match(/\.app$/) }
    }

    trash(found)
  end

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
