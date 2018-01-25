module Users
  class SearchQuery < BaseScopeQuery
    def initialize(relation = User.all)
      @relation = relation
    end

    def call(conditions)
      @relation.where!(id: conditions[:id]) if conditions[:id].present?

      @relation.where!('name like ?', "%#{conditions[:name]}%") if conditions[:name].present?

      @relation.where!(zip: conditions[:zip]) if conditions[:zip].present?

      @relation.where!(sex: conditions[:sex]) if conditions[:sex].present?

      @relation
    end
  end
end
