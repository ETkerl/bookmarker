module JsonHelpers
    def load_body(response)
      JSON.parse(response.body)
    end
  end