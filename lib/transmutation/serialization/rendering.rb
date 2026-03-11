# frozen_string_literal: true

module Transmutation
  module Serialization
    module Rendering
      # Serializes the value of the `json` parameter before calling the existing render method.
      def render(*args, json: nil, serialize: true, namespace: nil, serializer: nil, max_depth: Transmutation.max_depth, **kwargs)
        return super(*args, **kwargs) unless json
        return super(*args, **kwargs, json:) unless serialize

        super(*args, **kwargs, json: serialize(json, namespace:, serializer:, max_depth:))
      end
    end
  end
end
