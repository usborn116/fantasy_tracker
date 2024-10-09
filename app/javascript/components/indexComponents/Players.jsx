import React, { useState, useEffect } from "react";
import { getData } from "../../helpers/api_methods";
import { useParams } from "react-router-dom";
import { RowHelper } from "../../helpers/RowHelper";
import { TextField } from "@mui/material";
import { Player } from "../Player";

export const Players = ({ passedData = null }) => {

    const [data, setData] = useState(passedData)
    const [loading, setLoading] = useState(false)
    const [searchTerm, setSearchTerm] = useState(null)
    const { league_id, team_id } = useParams()

    useEffect(() => {
        let url = `leagues/${league_id}/teams/${team_id}/roster`
        if (searchTerm) url += `?last_name=${searchTerm}`
        getData(url, setData)
    }, [searchTerm])

    console.log(searchTerm)

    const headers = <RowHelper items={['Name', 'Position', 'Draft Year', 'NBA Team', 'League Team', 'Trade Block']} />

    const list = data?.team?.players?.map(object => <RowHelper key={object.id} items={[
        `${object.first_name} ${object.last_name}`, object.position,
        object.draft_year, object.nba_team, object.team.name, String(object.trade_block) ]} />)

    return (
        data &&
        <div>
                <TextField placeholder="Search By Last Name" onChange={(e) => setSearchTerm(e.target.value)} />
                <h1>Search Results</h1>
                <div>
                    {data?.search_results?.map(object => <RowHelper key={object.id} items={[
                        `${object.first_name} ${object.last_name}`, object.position,
                        object.draft_year, object.nba_team] } />)}
                </div>
                <h1>Current Roster</h1>
            {headers}
            {list}
        </div>
        
    )
}