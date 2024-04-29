class Swagger::Controllers::OauthTokenController
    include Swagger::Blocks
  
    # ...
  
    swagger_path '/oauth/token/info' do
      operation :get do
        key :description, 'Show details about the token used for authentication'
        key :tags, [
          'oauth'
        ]
  
        parameter do
          key :name, :Authorization
          key :in, :header
          key :required, true
          schema do
            key :type, :string
          end
        end
  
        response 200 do
          key :description, 'Details about the specified token'
          schema do
            key :'$ref', :OauthTokenInfo
          end
        end
  
        response 401 do
          key :description, 'Unauthorized'
          schema do
            key :'$ref', :Unauthorized
          end
        end
      end
    end
  end