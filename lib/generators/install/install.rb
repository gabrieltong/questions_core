module QuestionCore
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)

      # Complete wtf that this isn't provided elsewhere.
    def self.next_migration_number(dirname)
      if ActiveRecord::Base.timestamped_migrations
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end

    def manifest
      migration_template 'migration.rb', 'db/migrate/create_questions.rb'
      copy_file 'question.rb', 'app/models/question.rb'
    end
  end
end
