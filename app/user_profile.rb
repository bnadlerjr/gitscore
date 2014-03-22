module Gitscore
  UserProfile = Struct.new(:username, :name, :events) do
    def initialize(**attrs)
      attrs.each { |k, v| self[k] = v }
      self[:events] = []
    end

    def score
      self.events.reduce(0) { |sum, e| sum + e.score }
    end
  end
end
