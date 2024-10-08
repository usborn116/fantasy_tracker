import React, { useState, useEffect } from "react";
import { getData } from "../../helpers/api_methods";
import { useParams } from "react-router-dom";
import { RowHelper } from "../../helpers/RowHelper";

export const Players = ({ passedData = null }) => {

    const [data, setData] = useState(passedData)
    const { league_id, team_id } = useParams()

    useEffect(() => {
        getData(`leagues/${league_id}/teams/${team_id}/roster`, setData)
    }, [])

    console.log(data)

    const headers = <RowHelper items={['Name', 'Position', 'Draft Year', 'NBA Team', 'League Team', 'Trade Block']} />

    const list = data?.team?.players?.map(object => <RowHelper key={object.id} items={[
        `${object.first_name} ${object.last_name}`, object.position,
        object.draft_year, object.nba_team, object.team.name, String(object.trade_block) ]} />)

    return (
        data &&
        <div>
            {headers}
            {list}
        </div>
        
    )
}