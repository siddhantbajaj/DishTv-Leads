module Api
  module V1
    class UsersApiController < ::ApiController

      def signin
        username = params["username"]
        password = params["password"]
        user = User.find_by_username(username)
        if user
          if user.password == password
            data = Hash.new
            data["user"] = user
            return response_data(data, "Signed In", 200)
          else
            return response_data({}, "Password Invalid", 200)
          end
        else
          return response_data({}, "User doesn't exist", 200)
        end
        return response_data({}, "Signed In", 200)
      end

      def signup
        username = params["username"]
        password = params["password"]
        reconfirm_password = params["reconfirm_password"]
        user = User.find_by_username(username)
        unless user
          if password == reconfirm_password
            user = User.new
            user.username = username
            user.password = password
            user.access_token = SecureRandom.hex
            user.save!
            data = Hash.new
            data["user"] = user
            return response_data(data, "Success", 200)
          else
            return response_data(user, "Password and reconfirm password doesn't match", 200)
          end
        else
          return response_data({}, "User already exists", 200)
        end
      end
    end
  end
end