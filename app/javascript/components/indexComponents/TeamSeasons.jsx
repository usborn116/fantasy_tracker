import React, { useState, useEffect } from "react";
import { getData } from "../../helpers/api_methods";
import { useParams } from "react-router-dom";
import { RowHelper } from "../../helpers/RowHelper";

export const TeamSeasons = ({ team_seasons = null }) => {

    const [data, setData] = useState(team_seasons)
    const { league_id, team_id } = useParams()

    useEffect(() => {
        getData(`leagues/${league_id}/teams/${team_id}/team_seasons`, setData)
    }, [])

    console.log(data)

    const headers = <RowHelper items={['Team', 'Start', 'End', 'Roster Size', 'Soft Cap', 'Hard Cap',
                                        'Max RFA Bid', 'Max UFA Bid', 'Picks', 'Dead Cap']} />

    const list = data?.map(object => <RowHelper
        url={`/leagues/${league_id}/teams/${team_id}/team_seasons/${object.id}`}
        key={object.id}
        items={[object.team.name, object.season.start_year,
            object.season.end_year, object.roster_size,
            object.soft_cap_room, object.hard_cap_room,
            object.max_RFA_bid, object.max_UFA_bid,
            object.incoming_picks, object.dead_cap]}
    />)

    return (
        data &&
        <div>
            {headers}
            {list}
        </div>
        
    )
}