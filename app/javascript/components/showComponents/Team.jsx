import React, { useState, useEffect } from "react";
import { getData } from "../../helpers/api_methods";
import { useParams } from "react-router-dom";
import { RowHelper } from "../../helpers/RowHelper";
import { Players } from "../indexComponents/Players";
import { DraftPicks } from "../indexComponents/DraftPicks";
import { TeamSeasons } from "../indexComponents/TeamSeasons";

export const Team = ({ passedData = null }) => {

    const [data, setData] = useState(passedData)
    const { league_id, team_id } = useParams()

    useEffect(() => {
        getData(league_id ? `leagues/${league_id}/teams/${team_id}` : `user_teams/${team_id}`, setData)
    }, [])

    const headers = <RowHelper items={['Team Name', 'League Name', 'Owners']} />

    return (
        data &&
        <div>
            {headers}
            <RowHelper items={[
                                data?.name, data?.league.name, data.users.map(u => u.email).join(', ')
                ]} />
                <h1>Roster</h1>
                <Players />
                <h1>Draft Picks</h1>
                <DraftPicks passedData={data?.draft_picks} />
                <h1>Team Seasons</h1>
                <TeamSeasons />
        </div>
        
    )
}