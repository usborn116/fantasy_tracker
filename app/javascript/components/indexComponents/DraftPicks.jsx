import React, { useState, useEffect } from "react";
import { getData } from "../../helpers/api_methods";
import { useParams } from "react-router-dom";
import { RowHelper } from "../../helpers/RowHelper";

export const DraftPicks = ({ passedData = null }) => {

    const [data, setData] = useState(passedData)
    const { league_id, season_id } = useParams()

    useEffect(() => {
        getData(`leagues/${league_id}/seasons/${season_id}/draft_picks`, setData)
    }, [])

    console.log(data)

    const headers = <RowHelper items={['Season', 'Year', 'Round', 'Pick', 'Original Owner', 'Current Owner']} />

    const list = data?.map(object => <RowHelper key={object.id} items={[
        object.season.end_year, object.year, object.round,
        object.pick, object.original_owner.name, object.team.name ]} />)

    return (
        data &&
        <div>
            {headers}
            {list}
        </div>
        
    )
}