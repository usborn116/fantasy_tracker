import React, {useState, useEffect } from "react";
import * as ReactDOM from "react-dom/client";
import { Player } from "./Player";

export const App = () => {

    const [data, setData] = useState([])

    useEffect(() => {
        (async () => {
            const response = await fetch('api/nba_pool/players')
            const data = await response.json()
            setData(data)
        })()
    }, [])

    console.log(data)

    const dataPresent = data?.map(d => (
        <Player first={d.first_name} last={d.last_name} position={d.position} nba_team={d.nba_team} draft_year={d.draft_year}/>
    ))

    return (
        <div>
            <h1>Hello from React!</h1>
            {dataPresent}
        </div>
        
    )
}