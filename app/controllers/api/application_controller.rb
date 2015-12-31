module Api
  class ApplicationController < ActionController::API

    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { error: 'ActiveRecord::RecordNotFound', message: e.message }
    end


    def serialized(obj, opts={})
      unless obj.is_a?(ActiveRecord::Base) || obj.is_a?(ActiveRecord::Relation)
        return obj.as_json
      end

      ActiveModel::SerializableResource.new(obj, opts).serializable_hash
    end
  end
end