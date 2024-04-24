# frozen_string_literal: true

module Renderer
    def render_object(resource, **options)
        options.merge!(json: resource, root: :data)
        options.merge!(status: :ok) unless options.key?(:status)
        options.merge!(meta: assign_metadata(resource))
         puts(options)
        # render json: resource, root: :json, meta: assign_metadata(resource)

        render options
        # render({
        #     json: resource,
        #     root: :data,
        #     status: :ok,
        #     meta: assign_metadata(resource)
        # }.merge(options))
        # puts(options)
    end

    def render_errors(errors, status = :unprocessable_entity)
        render json: { errors: errors.messages }, status: status
    end

    def assign_metadata(resource)
        { resource: resource.class.name, count: resource.class.count }
    end
end