class MatchesController < ApplicationController

    def get_match(id)

        match = Match.find_by(id: params[:id])
        home_participant = HomeParticipant.find_by(id: match.home_participant_id)
        home_team = Team.find_by(id: params[:home_participant.team_id])
        visitor_participant = VisitorParticipant.find_by(id: match.visitor_participant_id)
        visitor_team = Team.find_by(id: params[:visitor_participant.team_id])

        if match
            render json:{ stadium: match.stadium, start_date: match.start_date, end_date: match.end_date, 
            home_team_name: home_team.name, home_yellow_cards: home_participant.yellow_cards, 
            home_red_cards: home_participant.red_cards,
            visitor_team_name: visitor_team.name, visitor_yellow_cards: visitor_participant.yellow_cards, 
            visitor_red_cards: visitor_participant.red_cards}
        else
            render json: {message: "invalid match"}
        end
    end

    def get_matches
        season = Season.find_by(id: params[:id])
        if season
            matches = season.matches
            matches_by_season = matches.map{|match| get_all_match_details(match.id)}
            render json: {matches: matches_by_season}
        else
            render json: {message: "invalid season"}
        end
    end
    
    def get_all_match_details(id)

        match = Match.find_by(id: id)
        home_participant = HomeParticipant.find_by(id: match.home_participant_id)
        home_team = Team.find_by(id: home_participant.team_id)
        visitor_participant = VisitorParticipant.find_by(id: match.visitor_participant_id)
        visitor_team = Team.find_by(id: visitor_participant.team_id)

        if match
            # total_goals = visitor_participant.goals + home_participant.goals

            return { id: match.id, stadium: match.stadium, start_date: match.start_date, end_date: match.end_date, 
            home_team_name: home_team.name, home_yellow_cards: home_participant.yellow_cards, 
            home_red_cards: home_participant.red_cards, home_goals: home_participant.goals,
            visitor_team_name: visitor_team.name, visitor_yellow_cards: visitor_participant.yellow_cards, 
            visitor_red_cards: visitor_participant.red_cards, visitor_goals: visitor_participant.goals}
            # total_goals: total_goals}
        else
            return {message: "invalid match"}
        end
        
    end

    def create_match

        home_participant = HomeParticipant.new(team_id: params[:team_id], yellow_cards: params[:yellow_cards], 
        red_cards: params[:red_cards], goals: params[:goals])

        visitor_participant = VisitorParticipant.new(team_id: params[:team_id2], yellow_cards: params[:yellow_cards2],
        red_cards: params[:red_cards2], goals: params[:goals_2])

        if home_participant.valid? && visitor_participant.valid?

            home_participant.save
            visitor_participant.save

            home_team = Team.find_by(id: home_participant.team_id)
            visitor_team = Team.find_by(id: visitor_participant.team_id)

            match = Match.new(start_date: params[:start_date], end_date: params[:end_date], visitor_participant_id: visitor_participant.id,
            home_participant_id: home_participant.id , season_id: params[:season_id], stadium: params[:stadium])

            if match.valid?
                match.save
                # total_goals = visitor_participant.goals + home_participant.goals
                render json: {id: match.id, stadium: match.stadium, start_date: match.start_date, end_date: match.end_date, 
                home_team_name: home_team.name, home_yellow_cards: home_participant.yellow_cards, 
                home_red_cards: home_participant.red_cards, home_goals: home_participant.goals,
                visitor_team_name: visitor_team.name, visitor_yellow_cards: visitor_participant.yellow_cards, 
                visitor_red_cards: visitor_participant.red_cards, visitor_goals: visitor_participant.goals} 
                # total_goals: total_goals}
            else
                render json: {message: "Invalid Match"}
            end
        else
            render json: {message: "Invalid Participants"}
        end


    end

    private

    def match_params
        params.permit(:start_date, :end_date, :stadium, :season_id)
    end
end
