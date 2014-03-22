module Gitscore
  SCORES = {
    "CommitCommentEvent" => 2,
    "IssueCommentEvent"  => 2,
    "IssueEvent"         => 3,
    "WatchEvent"         => 1,
    "PullRequestEvent"   => 5
  }

  Event = Struct.new(:type) do
    def initialize(**attrs)
      attrs.each { |k, v| self[k] = v }
    end

    def score
      SCORES.fetch(self.type) { 0 }
    end
  end
end
