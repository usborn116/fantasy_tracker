import React, {useState, useEffect } from "react";
import * as ReactDOM from "react-dom/client";
import { Player } from "./Player";
import { getData } from "../helpers/api_methods";
import { Logout } from "./Logout";
import { Outlet } from "react-router-dom";
import { Error } from "./Error";
import { Navbar } from "./Navbar";

export const App = () => {

    const [user, setUser] = useState(null)
    const [error, setError] = useState(null)
    const [loading, setLoading] = useState(false)
    
    
    useEffect(() => {
        getData('me', setUser, setError)
    }, [loading])

    return (
        <div>
            <Navbar user={user} setUser={setUser} setLoading={setLoading} setError={setError}/>
            {error && <Error status={error} />}
            {user?.created_at ? <Logout setUser={setUser} setLoading={setLoading} /> : ''}
            <Outlet context={[setError]}/>
        </div>
        
    )
}