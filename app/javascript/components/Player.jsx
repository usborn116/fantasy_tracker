import React from "react";
import * as ReactDOM from "react-dom/client";

export const Player = ({ first, last, position, nba_team, draft_year } ) => {

    return (
        <div>
            <h2>{first}</h2>
            <h2>{last}</h2>
            <h4>{position}</h4>
            <h4>{nba_team}</h4>
            <h4>{draft_year}</h4>
        </div>
    )
}