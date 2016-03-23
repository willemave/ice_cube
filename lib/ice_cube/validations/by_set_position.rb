module IceCube
  module Validations::BySetPosition
    def by_set_position(*positions)
      @positions = positions.is_a?(Array) ? positions : [positions]
    end
  end
end
