import React, { useState, useEffect } from "react";
import { getData, newData } from "../../helpers/api_methods";
import { useParams } from "react-router-dom";
import { RowHelper } from "../../helpers/RowHelper";
import { TextField } from "@mui/material";
import { Button } from "@mui/material";
import { Error } from "../Error";

export const Players = ({ passedData = null }) => {

    const [data, setData] = useState(passedData)
    const [loading, setLoading] = useState(false)
    const [searchTerm, setSearchTerm] = useState('')
    const { league_id, team_id } = useParams()
    const [error, setError] = useState(null)

    useEffect(() => {
        let url = `leagues/${league_id}/teams/${team_id}/roster`
        if (searchTerm) url += `?last_name=${searchTerm}`
        getData(url, setData)
    }, [searchTerm, loading])

    console.log(error)

    const headers = <RowHelper items={['Name', 'Position', 'Draft Year', 'NBA Team', 'League Team', 'Trade Block']} />

    const list = data?.team?.players?.map(object => <RowHelper
        url={`/leagues/${league_id}/players/${object.id}`}
        key={object.id}
        items={[
        `${object.first_name} ${object.last_name}`, object.position,
            object.draft_year, object.nba_team, object.team.name, String(object.trade_block)]}
    />)
    
    const addPlayerToRoster = async (nba_id) => {
        setLoading(true)
        setSearchTerm(() => '')
        await newData(`leagues/${league_id}/players?team_id=${team_id}&nba_player_id=${nba_id}`, null, setError )
        setLoading(false)
    }

    return (
        <>
        { error && <Error message={error} /> }
            {data &&
                <div>
                    <TextField id="search" placeholder="Search By Last Name" value={searchTerm} onChange={(e) => setSearchTerm(e.target.value)} />
                    <h2>Search Results</h2>
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
                    <h2>Current Roster</h2>
                    {headers}
                    {list}
                </div>}
            </>
        
    )
}