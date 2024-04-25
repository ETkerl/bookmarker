# frozen_string_literal: true

module Renderer
    def render_object(resource, **options)
        root = options.fetch(:root, :data)
        meta = options.fetch(:meta, assign_metadata(resource))

        json = { root => resource }
        json[:meta] = meta if meta.present?

        render json: json, status: options.fetch(:status, :ok)
    end

    def render_errors(errors, status = :unprocessable_entity)
        render json: { errors: errors }, status: status
    end

    def assign_metadata(resource)
        { resource: resource.class.name, count: resource.class.count }
    end
end
