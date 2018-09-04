class User < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  has_many :permissions
end