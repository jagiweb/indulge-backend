class SeasonsController < ApplicationController

    def get_season
        season = Season.find_by(id: params[:id])
        if season
            render json: {season: season, matches: season.matches}
        else
            render json: {message: "Invalid"}
        end
    end

    def create_season
        season = Season.new(season_params)
        if season.valid?
            season.save
            render json: {season: season}
        else
            render json: {message: "invalid"}
        end
    end

    private

    def season_params
        params.permit(:name, :start_date, :end_date, :tournament_id)
    end
end
