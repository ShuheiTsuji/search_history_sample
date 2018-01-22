# frozen_string_literal: true

class BaseScopeQuery
  # https://qiita.com/furaji/items/12cef3ec4d092865af88
  # query objectをmodelのscopeで使いたい場合、scopeは、第一引数でscope名、第二引数は `call` メソッドを持つ必要がある。
  #
  # `scope :search, UserSearchQuery.new`
  # とすると、modelロード時にUserSearchQuery.newが評価されてしまい、@relationを動的に変更できないため、
  # `scope :search, UserSearchQuery` とする。
  #
  # よって、クラスメソッドself.callが必要となるが、そうなると、@relationのインスタンス変数が利用できない。
  #
  # よって下記のように、クラスメソッドself.callを、インスタンスメソッド.callにdelegateする
  #
  # 下記と同義
  # def self.call
  #   new.call
  # end
  class << self
    delegate :call, to: :new
  end
end
