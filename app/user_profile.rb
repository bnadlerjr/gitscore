module Gitscore
  UserProfile = Struct.new(:username, :name) do
    def initialize(**attrs)
      attrs.each { |k, v| self[k] = v }
    end
  end
end
