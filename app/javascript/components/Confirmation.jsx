import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { getData } from "../helpers/api_methods";

export const Confirmation = () => {

    const [ confirmed, setConfirmed ] = useState(null)
    const [ error, setError ] = useState(false)
    const { id, token } = useParams()


    useEffect(() => {
        getData(`users/confirmation.${id}?confirmation_token=${token}`, setConfirmed, setError)
    }, [])

    return (
        <div>
            {confirmed && 'Your account has been confirmed'}
            {error && 'There was an error'}
        </div>
    )
}