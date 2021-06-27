module Api
  module V1
    class RentController < ApplicationController
      before_action :authenticate_user!

      def index
        @rent = User.find(params[:user_id]).rent
        render_paginated @rent, each_serializer: RentSerializer
      end

      def create
        @rent = Rent.create!(rent_param)
        render json: RentSerializer.new.serialize(@rent).to_json, status: :created
      end

      def book_rankings
        render_paginated Book.book_rents_rankings, each_serializer: BookSerializer
      end

      def active_rents
        render_paginated Rent.active_rents_by_date(Time.now.to_date),
                         each_serializer: RentSerializer
      end

      private

      def rent_param
        params.require(:rent).permit(:user_id, :book_id, :start_date, :end_date)
      end

    end
  end
end
