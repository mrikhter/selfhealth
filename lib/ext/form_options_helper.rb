module ActionView
  module Helpers
    module FormOptionsHelper
 
      def value_for_collection(item, value)
        # binding.pry
        if value == :key
          item[0]
        elsif value == :value
          item[1]
        else
          value.respond_to?(:call) ? value.call(item) : item.send(value)
        end
      end

    end
  end
end