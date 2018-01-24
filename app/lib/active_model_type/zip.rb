module ActiveModelType
  class Zip < ActiveModel::Type::String
    def cast_value(value)
      super(super&.remove(/[\-_]/))
    end
  end
end
