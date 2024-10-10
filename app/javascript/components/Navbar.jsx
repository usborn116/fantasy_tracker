import React, { useState } from "react";
import { Link } from "react-router-dom";
import { Logout } from "./Logout";

export const Navbar = ({setUser, user, setLoading, setError}) => {

    const [loggedOut, setLoggedOut] = useState(false)

    const logoutMessage = async () => {
        setLoading(() => true)
        setLoggedOut(() => true)
        await setTimeout(() => setLoggedOut(() => false), 900)
        setLoading(() => false)
    }

    return (
        <div className="nav">
            { loggedOut ? 
            <>
            <div></div>
            <div className="center-bar">
                <h1>Logged Out!</h1>
            </div> 
            <div></div>
            </>
            
            :
            <>
            <div className="left-bar">
                <Link to="/me" className="button">Me</Link>
            </div>
            <div className="center-bar">
                        <h1>Welcome to Fantasy Tracker {user?.name ?? user?.email ?? ''}</h1>
            </div>
            <div className="right-bar">
                {user ? <Link to="/leagues" className="button">My Leagues</Link> : ''}
                {user ? <Link to="/teams" className="button">My Teams</Link> : ''}
                {user ? <Logout setUser={setUser} user={user} setLoading={setLoading}
                            logoutMessage={logoutMessage} setError={setError} /> :
                            <Link className="button" to={'/login'}>Log In</Link>}
            </div> 
            </>
            }
        </div>
    )

};