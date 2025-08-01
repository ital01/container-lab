require 'sinatra'

set :bind, '0.0.0.0'
set :port, 3000

get '/' do
  content_type :json
  '{"message": "Study from Ruby!"}'
end
