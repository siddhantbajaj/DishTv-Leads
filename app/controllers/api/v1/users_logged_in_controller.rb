module Api
  module V1
    class UsersLoggedInController < ::ApiController

      # include ActionController::HttpAuthentication::Token::ControllerMethods

      before_action :authenticate_user, except: [:authenticate_user]

      def generate_lead
        lead = Lead.create(name: params[:name],
                    actual_price: params[:actual_price],
                    number: params[:number],
                    latitude: params[:latitude],
                    longitude: params[:longitude],
                    source: 'web',
                    rating: params[:rating],
                    user_id: current_user_api.id)
        data = Hash.new
        data["lead"] = lead
        return response_data(data, "Lead created", 200);
      end

      def leads

      end

      def update_lead
        lead = Lead.find_by_id(params[:lead_id])
        if lead
          lead.update(base_price: params[:base_price])
          data = Hash.new
          data["lead"] = lead
          return response_data(data, "Lead updated", 200);
        end
        return response_data({}, "Lead not found", 404);
      end


      def authenticate_user
        # byebug
        # authenticate_with_http_token do |token, options|
        @current_user_api = User.find_by_access_token(params["token"])
        # end
        unless @current_user_api
          return response_data({},"Not Authorised",401)
        end
      end

      def current_user_api
        @current_user_api
      end

    end
  end
end