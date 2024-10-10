import React, { useState, useEffect } from "react";
import { getData } from "../../helpers/api_methods";
import { useParams } from "react-router-dom";
import { RowHelper } from "../../helpers/RowHelper";
import { DraftPicks } from "../indexComponents/DraftPicks";
import { Salaries } from "../indexComponents/Salaries";

export const Season = ({ passedData = null }) => {

    const [data, setData] = useState(passedData)
    const { league_id, season_id } = useParams()

    useEffect(() => {
        getData(`leagues/${league_id}/seasons/${season_id}`, setData)
    }, [])

    const headers = <RowHelper items={['League Name', 'Start', 'End', 'Base Cap']} />

    return (
        data &&
        <div>
            {headers}
            <RowHelper items={[
                        data.league.name, data.start_year, data.end_year, data.base_cap
                ]} />
                <h1>Draft Picks</h1>
                <DraftPicks passedData={data?.draft_picks}/>
                <h1>Salaries</h1>
                <Salaries passedData={data?.salaries}/>
        </div>
        
    )
}