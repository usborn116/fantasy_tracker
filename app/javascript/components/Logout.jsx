import React, {useEffect} from "react";
import { useNavigate } from "react-router-dom";
import { getData, logout } from "../helpers/api_methods";

export const Logout = ({setUser, setLoading}) => {

    const navigate = useNavigate()

    const handleLogout = async (e) =>{
        e.preventDefault()
        setLoading(() => true)
        await logout()
        await getData('me', setUser)
        setLoading(() => false)
        //navigate('/')
    }

    return <button data-testid='logout-button' className="button" onClick={handleLogout}>Log Out</button>

};