import React, {useState, useEffect } from "react";
import * as ReactDOM from "react-dom/client";
import { Player } from "./Player";
import { getData } from "../helpers/api_methods";
import { Logout } from "./Logout";
import { Outlet } from "react-router-dom";
import { Error } from "./Error";

export const App = () => {

    const [data, setData] = useState([])
    const [user, setUser] = useState(null)
    const [error, setError] = useState(null)
    const [loading, setLoading] = useState(false)
    
    
    useEffect(() => {
        getData('me', setUser, setError)
    }, [loading])

    console.log(loading, user)

    /*
    useEffect(() => {
        getData('nba_pool/players', setData)
    }, [])

    const dataPresent = data?.map(d => (
        <Player key={d.nba_id} id={d.id} />
    ))
    */

    return (
        <div>
            {error && <Error status={error} />}
            {user?.created_at ? <Logout setUser={setUser} setLoading={setLoading} /> : ''}
            <h1>NBA Players</h1>
            <Outlet context={[setError]}/>
        </div>
        
    )
}