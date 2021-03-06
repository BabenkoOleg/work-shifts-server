module Api
  module Auth
    class CurrentUsersController < ApiController

      # GET /api/auth/current-user
      def show
        render json: CurrentUserSerializer.new(current_user, include: [:business])
      end
    end
  end
end

