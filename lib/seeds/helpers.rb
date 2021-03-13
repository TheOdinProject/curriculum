module Seeds
  module Helpers
    def destroy_removed_seeds(persisted_collection, seeded_collection)
      removed_uuids = persisted_collection.map(&:identifier_uuid) - seeded_collection.map(&:identifier_uuid)
      persisted_collection.where(identifier_uuid: removed_uuids).each(&:destroy)
    end
  end
end
