import React, { useState, useEffect } from "react";
import { getData } from "../../helpers/api_methods";
import { RowHelper } from "../../helpers/RowHelper";
import { Leagues } from "../indexComponents/Leagues";
import { Teams } from "../indexComponents/Teams";

export const Me = ({ passedData = null }) => {

    const [data, setData] = useState(passedData)

    useEffect(() => {
        getData(`me`, setData)
    }, [])

    const headers = <RowHelper items={['Name', 'Email']} />

    return (
        data &&
        <div>
            {headers}
                <RowHelper items={[data.name, data.email]} />
                <h1>Leagues</h1>
                <Leagues />
                <h1>Teams</h1>
                <Teams />
        </div>
        
    )
}