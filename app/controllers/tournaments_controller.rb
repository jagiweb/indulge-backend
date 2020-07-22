class TournamentsController < ApplicationController

    def get_tournament
        tournament = Tournament.find_by(id: params[:id])
        if tournament
            render json: {tournament: tournament, seasons: tournament.seasons}
        else
            render json: {message: "Invalid"}
        end

    end

    def create_tournament
        tournament = Tournament.new(tournament_params)
        if tournament.valid?
            tournament.save
            render json: {tournament: tournament}
        else
            render json: {message: "invalid"}
        end
    end

    private

    def tournament_params
        params.permit(:name, :country, :city, :types, :user_id)
    end
end
