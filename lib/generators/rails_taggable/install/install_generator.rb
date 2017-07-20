require 'rails/generators'
require 'rails/generators/migration'


module RailsTaggable
  module Generators

    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path("../templates", __FILE__)

      desc "Copy migrations to main project"
      def self.next_migration_number(dirname)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end


      def copy_migration_tags
        migration_template 'db/migrate/create_tags.rb', "db/migrate/create_tags.rb"
        migration_template 'db/migrate/create_taggings.rb', "db/migrate/create_taggings.rb"
      end

      def copy_initializer
        template 'config/initializers/rails_taggable.rb', 'config/initializers/rails_taggable.rb'
      end

    end

  end
end

