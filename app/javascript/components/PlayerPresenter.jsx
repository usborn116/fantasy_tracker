import React from "react";

export const PlayerPresenter = ({ first, last, position, nba_team, draft_year }) => {

    return (
        <div className="player-listing">
            <div className="name">
                {first} {last}
            </div>
            <div className="player-details">
                <div>Position: {position}</div>
                <div>Current NBA Team: {nba_team}</div>
                <div>Drafted: {draft_year}</div>
            </div>
        </div>
    )
}