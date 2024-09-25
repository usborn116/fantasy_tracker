import React, {useState, useEffect } from "react";
import * as ReactDOM from "react-dom/client";
import { Player } from "./Player";
import { getData } from "../helpers/api_methods";

export const App = () => {

    const [data, setData] = useState([])

    useEffect(() => {
        getData('nba_pool/players', setData)
    }, [])

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