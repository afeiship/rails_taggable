module RailsTaggable
  class InitializerGenerator < Rails::Generators::Base
    source_root File.expand_path("templates", __dir__)
    desc "Initialize necessary files to use RailsTaggable"

    def create_initializer
      copy_file "initializers/rails_taggable.rb", "config/initializers/rails_taggable.rb"
      puts "Add rails_taggable.rb to: config/initializer/rails_taggable.rb"
    end
  end
end
