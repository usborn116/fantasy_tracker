import React, { useState, useEffect } from "react";
import { getData, newData } from "../../helpers/api_methods";
import { useParams } from "react-router-dom";
import { RowHelper } from "../../helpers/RowHelper";
import { Salaries } from "../indexComponents/Salaries";

export const Player = ({ passedData = null }) => {

    const [data, setData] = useState(passedData)
    const { league_id, player_id } = useParams()

    useEffect(() => {
        let url = `leagues/${league_id}/players/${player_id}`
        getData(url, setData)
    }, [])

    const headers = <RowHelper items={['Name', 'Position', 'Draft Year', 'NBA Team', 'League Team', 'Trade Block']} />

    return (
            data &&
            <div>
                {headers}
                <RowHelper items={[
                    `${data.first_name} ${data.last_name}`, data.position,
                    data.draft_year, data.nba_team, data.team.name, String(data.trade_block)]}
                />
                <h1>Salaries</h1>
                <Salaries passedData={data?.salaries} />
            </div>
        
    )
}