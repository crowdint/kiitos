namespace :kiitos do
  desc "Populate the categories and kiitos"
  task :populate => :environment do

    # Set possible categories
    categories = [
      'friendliness',
      'commitment',
      'honesty',
      'humility',
      'perseverance',
      'proactivity',
      'solidarity',
      'tolerance',
      'leadership'
    ]

    begin
      categories.each do |category|
        kiito_category = Kiitos::Category.find_or_create_by_name category

        # Creating kiitos and loading the correct images
        Kiitos::Kiito.where(title: category).first || Kiitos::Kiito.create(
          title: category,
          kiitos_category_id: kiito_category.id,
          state: 'enabled',
          image: File.open("app/assets/images/kiitos/PNG/kiitos/#{category}.png")
        )
      end

      puts "Created categories....................... ✓"
      puts "Created kiitos........................... ✓"
    rescue Exception => e
      puts "Error: #{e.inspect}"
    end
  end
end
