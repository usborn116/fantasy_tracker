import React, { useState, useEffect } from "react";
import { getData } from "../../helpers/api_methods";
import { useParams } from "react-router-dom";
import { RowHelper } from "../../helpers/RowHelper";

export const TeamSeason = ({ passedData = null }) => {

    const [data, setData] = useState(passedData)
    const { league_id, team_id, team_season_id } = useParams()

    useEffect(() => {
        getData(`leagues/${league_id}/teams/${team_id}/team_seasons/${team_season_id}`, setData)
    }, [])

    const headers = <RowHelper items={['Team', 'Start', 'End', 'Roster Size', 'Soft Cap', 'Hard Cap',
                                        'Max RFA Bid', 'Max UFA Bid', 'Picks', 'Dead Cap']} />

    return (
        data &&
        <div>
            {headers}
             <RowHelper items={[
                    data.team.name, data.season.start_year, data.season.end_year,
                    data.roster_size, data.soft_cap_room, data.hard_cap_room, data.max_RFA_bid,
                    data.max_UFA_bid, data.incoming_picks, data.dead_cap]}
                />
        </div>
        
    )
}