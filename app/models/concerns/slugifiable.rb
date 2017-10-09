module Slugifiable

  module InstanceMethods

    def slug
      self.name.downcase.split(" ").join("-")
    end

  end

  module ClassMethods

    def find_by_slug(slug)
      match = ""

      self.all.each do |el|
        if el.slug == slug
          match = el
        end
      end
      match

    end

  end

end