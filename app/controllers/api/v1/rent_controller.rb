module Api
  module V1
    class RentController < ApplicationController
      before_action :authenticate_user!

      def index
        #RentMailer.new_mail.deliver_later
        @rent = User.find(params[:user_id]).rents
        authorize @rent
        render_paginated @rent, each_serializer: RentSerializer
      end

      def create
        @rent = Rent.new(rent_param)
        @rent.user_id = params[:user_id]
        authorize @rent
        @rent.save!
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
        params.require(:rent).permit(:book_id, :start_date, :end_date)
      end

    end
  end
end
