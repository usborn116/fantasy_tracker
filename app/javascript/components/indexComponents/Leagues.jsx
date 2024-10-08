import React, { useState, useEffect } from "react";
import { getData } from "../../helpers/api_methods";
import { RowHelper } from "../../helpers/RowHelper"

export const Leagues = () => {

    const [data, setData] = useState(null)

    useEffect(() => {
        getData(`leagues`, setData)
    }, [])

    const headers = <RowHelper items={['League ID', 'Name']} />

    const list = data?.map(object => <RowHelper key={object.id} items={[object.league_id, object.name]} />)

    return (
        data &&
        <div>
            {headers}
            {list}
        </div>
        
    )
}