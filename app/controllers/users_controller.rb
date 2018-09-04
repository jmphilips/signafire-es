class UsersController < ApplicationController
  def access
    user = User.find_by(username: params[:username])
    res = user.permissions.map do |record|
      record = retrieve_record(record.user_record)
      serialize_record(record)
    end
    render json: res
  end

  private

  def serialize_record(record)
    puts record
    record["_source"]["fullname"] = record["_source"]["firstname"] + " " + record["_source"]["lastname"]
    record
  end

  def retrieve_record(id)
    client = User.__elasticsearch__.client
    client.get({index: 'users', id: id})
  end
end