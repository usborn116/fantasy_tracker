import React, { useState, useEffect } from "react";
import { getData } from "../../helpers/api_methods";
import { RowHelper } from "../../helpers/RowHelper"
import { useParams } from "react-router-dom";
import { Teams } from "../indexComponents/Teams";
import { Seasons } from "../indexComponents/Seasons";
import { Members } from "../indexComponents/Members";

export const League = () => {

    const [data, setData] = useState(null)
    const { league_id } = useParams()

    useEffect(() => {
        getData(`leagues/${league_id}`, setData)
    }, [])

    return (
        data &&
        <div>
            <RowHelper items={['League ID', 'Name']} />
                <RowHelper items={[data.league_id, data.name]} />
                <h1>Teams</h1>
                <Teams />
                <h1>Seasons</h1>
                <Seasons />
                <h1>Members</h1>
                <Members />
        </div>
        
    )
}