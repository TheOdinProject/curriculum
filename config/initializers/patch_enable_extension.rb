require 'active_record/connection_adapters/postgresql_adapter'

# NOTE: patch for https://devcenter.heroku.com/changelog-items/2446
# Source: https://stackoverflow.com/questions/73214844/error-extension-btree-gist-must-be-installed-in-schema-heroku-ext/73289426#73289426
module EnableExtensionHerokuPatch
  def enable_extension(name, **)
    return super unless schema_exists?('heroku_ext')

    exec_query("CREATE EXTENSION IF NOT EXISTS \"#{name}\" SCHEMA heroku_ext").tap { reload_type_map }
  end
end

module ActiveRecord
  module ConnectionAdapters
    class PostgreSQLAdapter
      prepend EnableExtensionHerokuPatch
    end
  end
end
