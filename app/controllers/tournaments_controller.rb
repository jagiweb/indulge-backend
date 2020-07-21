class TournamentsController < ApplicationController
    def get_tournament
        tournament = Tournament.find_by(id: params[:id])
        # byebug
        if tournament
            render json: {tournament: tournament, seasons: tournament.seasons}
        else
            render json: {message: "Invalid"}
        end

    end

    def create_tournament
        # user = User.find(params[:id])
        tournament = Tournament.new(tournament_params)
        if tournament.valid?
            tournament.save
            render json: {tournaments: user.tournaments.last}
        else
            render json: {message: "invalid"}
        end
    end

    private

    def tournament_params
        params.permit(:name, :country, :city, :types, :user_id)
    end
end
