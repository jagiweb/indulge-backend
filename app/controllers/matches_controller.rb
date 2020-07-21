class MatchesController < ApplicationController
    def get_match
        
    end

    def create_match
        match = Match.new(match_params)
        if match.valid?
            match.save
            render json:{match:match}
        else
            render json:{message: "Invalid match params"}
        end
    end

    private

    def match_params
        params.permit(:start_date, :end_date, :stadium, :season_id)
    end
end
