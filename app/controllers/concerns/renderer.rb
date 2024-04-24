# frozen_string_literal: true

module Renderer
    def render_object(resource, **options)
        options[:status] = options.fetch(:status, :ok)
        options[:root] = options.fetch(:root, :data)
        options[:meta] = options.fetch(:meta, assign_metadata(resource))

        render json: resource, root: :data, **options
    end

    def render_errors(errors, status = :unprocessable_entity)
        render json: { errors: errors.messages }, status: status
    end

    def assign_metadata(resource)
        { resource: resource.class.name, count: resource.class.count }
    end
end