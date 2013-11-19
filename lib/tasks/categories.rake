namespace :categories do
  desc 'Load categories table'
  task :load => [:environment] do
    Config[:categories].each do |name, data|
      category = Category.where(id: data[:id]).first_or_create!(name: data[:name])
    end
  end
end
