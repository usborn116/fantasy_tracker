import React, { useState, useEffect } from "react";
import { getData, newData } from "../../helpers/api_methods";
import { useParams } from "react-router-dom";
import { RowHelper } from "../../helpers/RowHelper";
import { TextField } from "@mui/material";
import { Button } from "@mui/material";

export const Players = ({ passedData = null }) => {

    const [data, setData] = useState(passedData)
    const [loading, setLoading] = useState(false)
    const [searchTerm, setSearchTerm] = useState(null)
    const { league_id, team_id } = useParams()
    const [error, setError] = useState(null)

    useEffect(() => {
        let url = `leagues/${league_id}/teams/${team_id}/roster`
        if (searchTerm) url += `?last_name=${searchTerm}`
        getData(url, setData)
    }, [searchTerm, loading])

    const headers = <RowHelper items={['Name', 'Position', 'Draft Year', 'NBA Team', 'League Team', 'Trade Block']} />

    const list = data?.team?.players?.map(object => <RowHelper key={object.id} items={[
        `${object.first_name} ${object.last_name}`, object.position,
        object.draft_year, object.nba_team, object.team.name, String(object.trade_block)]} />)
    
    const addPlayerToRoster = async (nba_id) => {
        setLoading(true)
        setSearchTerm(null)
        await newData(`leagues/${league_id}/players?team_id=${team_id}&nba_player_id=${nba_id}`, null, setError )
        setLoading(false)
    }

    return (
        data &&
        <div>
                <TextField placeholder="Search By Last Name" onChange={(e) => setSearchTerm(e.target.value)} />
                <h1>Search Results</h1>
                <div>
                    {data?.search_results?.map(object => (
                        <div key={object.id}>
                        <Button variant="outlined"
                                onClick={() => addPlayerToRoster(object.nba_id)}
                            >+</Button>
                        <RowHelper key={object.id} items={[
                        `${object.first_name} ${object.last_name}`, object.position,
                                object.draft_year, object.nba_team]} />
                        </div>)
                    )}
                </div>
                <h1>Current Roster</h1>
            {headers}
            {list}
        </div>
        
    )
}