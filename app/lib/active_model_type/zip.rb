module ActiveModelType
  class Zip < ActiveModel::Type::String
    def cast_value(value)
      value = value.to_s.remove(/[\-_]/)
      super(value)
    end
  end
end
