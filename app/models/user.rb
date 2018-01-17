class User < ApplicationRecord
  enum sex: %i( man woman )
end
