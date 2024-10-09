import React, {useState, useEffect } from "react";
import * as ReactDOM from "react-dom/client";
import { getData } from "../helpers/api_methods";
import { Logout } from "./Logout";
import { Outlet } from "react-router-dom";
import { Error } from "./Error";
import { Navbar } from "./Navbar";
import Button from '@mui/material/Button';

export const App = () => {

    const [user, setUser] = useState(null)
    const [error, setError] = useState(null)
    const [loading, setLoading] = useState(false)
    const [fetchNBAStatus, setFetchNBAStatus] = useState(null)

    useEffect(() => {
        getData('me', setUser, setError)
    }, [loading])

    const awaitNBAFetch = async () => {
        setLoading(true)
        await getData('nba_pool/nba_api', setFetchNBAStatus)
        setLoading(false)
    }

    return (
        <div>
            <Navbar user={user} setUser={setUser} setLoading={setLoading} setError={setError}/>
            {error && <Error status={error} />}
            {user?.created_at ? <Logout setUser={setUser} setLoading={setLoading} /> : ''}
            {loading ? 'Loading...' : ''}
            <h2>Last Fetched: { fetchNBAStatus?.message }</h2>
            <Button variant="outlined"
                onClick={awaitNBAFetch}
            >Fetch NBA Data</Button>
            <Outlet context={[setError]}/>
        </div>
        
    )
}