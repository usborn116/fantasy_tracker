import React, { useState, useEffect } from "react";
import { getData } from "../../helpers/api_methods";
import { useParams } from "react-router-dom";
import { RowHelper } from "../../helpers/RowHelper";

export const Teams = ({ teams = null }) => {

    const [data, setData] = useState(teams)
    const { league_id } = useParams()

    useEffect(() => {
        getData(league_id ? `leagues/${league_id}/teams` : `user_teams`, setData)
    }, [])

    const headers = <RowHelper items={['Team Name', 'League Name', 'Owners']} />

    const list = data?.map(object => <RowHelper key={object.id} items={[
                                            object.name, object.league.name, object.users.map(u => u.email).join(', ')
                                        ]} />)

    return (
        data &&
        <div>
            {headers}
            {list}
        </div>
        
    )
}