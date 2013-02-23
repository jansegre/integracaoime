namespace :cw do
  desc "Recreate image versions"
  task :recreate_versions => :environment do
    [Image, Hint, Highlight, Sponsor].each do |model|
      model.all.each do |instance|
        instance.image.recreate_versions! if instance.image?
      end
    end
  end
end
