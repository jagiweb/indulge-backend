class TeamsController < ApplicationController
    def get_team
        team = Team.find_by(id: params[:id])
        if team.valid?
            render json: {name: team.name, country: team.country, city: team.city}
        else
            render json: {message: "Team hasn't been found"}
        end
    end

    def get_teams
        teams_for_season = Season.find_by(id: params[:id]).teams
        if teams_for_season
            render json: {teams: teams_for_season}
        else
            render json: {message: "No teams or invalid season"}
        end
    end

    def create_team
        team = Team.new(team_params)
        # byebug
        if team.valid?
            team.save
            render json: {id: team.id, name: team.name, country: team.country, city: team.city}
        else
            render json: {message: "Invalid params for team"}
        end
    end

    def update_team
   
    end


    private

    def team_params
        params.permit(:name, :country, :city, :season_id)
    end

end
