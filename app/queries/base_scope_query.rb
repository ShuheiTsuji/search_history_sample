# frozen_string_literal: true

class BaseScopeQuery
  # 下記と同義
  # def self.call
  #   new.call
  # end
  class << self
    delegate :call, to: :new
  end
end
