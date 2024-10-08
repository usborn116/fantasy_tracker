import React, { useState, useEffect } from "react";
import { getData } from "../../helpers/api_methods";
import { useParams } from "react-router-dom";
import { RowHelper } from "../../helpers/RowHelper";

export const Seasons = ({ seasons = null }) => {

    const [data, setData] = useState(seasons)
    const { league_id } = useParams()

    useEffect(() => {
        getData(`leagues/${league_id}/seasons`, setData)
    }, [])

    const headers = <RowHelper items={['League Name', 'Start', 'End', 'Base Cap']} />

    const list = data?.map(object => <RowHelper key={object.id} items={[
                                            object.league.name, object.start_year, object.end_year, object.base_cap
                                        ]} />)

    return (
        data &&
        <div>
            {headers}
            {list}
        </div>
        
    )
}