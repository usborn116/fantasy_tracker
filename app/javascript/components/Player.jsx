import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { PlayerPresenter } from "./PlayerPresenter";
import { getData } from "../helpers/api_methods";

export const Player = (props) => {

    const id = props.id ?? useParams().player_id

    const [player, setPlayer] = useState(null)

    useEffect(() => {
        getData(`nba_pool/players/${id}`, setPlayer)
    }, [])

    return (
        player &&
        <div className="player-box">
                <PlayerPresenter first={player.first_name}
                    last={player.last_name}
                    position={player.position}
                    nba_team={player.nba_team}
                    draft_year={player.draft_year}
                />
        </div>
    )
}