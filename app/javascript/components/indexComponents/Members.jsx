import React, { useState, useEffect } from "react";
import { getData } from "../../helpers/api_methods";
import { useParams } from "react-router-dom";
import { RowHelper } from "../../helpers/RowHelper";

export const Members = ({ passedData = null }) => {

    const [data, setData] = useState(passedData)
    const { league_id } = useParams()

    useEffect(() => {
        getData(`leagues/${league_id}/members`, setData)
    }, [])

    const headers = <RowHelper items={['Name', 'Email', 'Teams']} />

    const list = data?.map(object => <RowHelper key={object.id} items={[
                                            object.name, object.email, object.teams.map(t => t.name).join(', ')
                                        ]} />)

    return (
        data &&
        <div>
            {headers}
            {list}
        </div>
        
    )
}