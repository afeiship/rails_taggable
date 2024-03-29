module RailsTaggable
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("templates", __dir__)
    desc "Configure necessary files to use RailsTaggable"

    def create_migration
      rake "rails_taggable:install:migrations"
    end
  end
end
