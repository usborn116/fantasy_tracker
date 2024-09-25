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
        <Player key={d.nba_id} id={d.id} />
    ))

    return (
        data &&
        <div>
            <h1>NBA Players</h1>
            {dataPresent}
        </div>
        
    )
}