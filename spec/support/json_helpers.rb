module JsonHelpers
  def load_body(response)
    # puts(response.body)
    JSON.parse(response.body)
  end

  def load_body_data(response)
    load_body(response)
  end

  def load_body_meta(response)
    load_body(response)
  end

  def load_body_errors(response)
    load_body(response)['errors']
  end
end