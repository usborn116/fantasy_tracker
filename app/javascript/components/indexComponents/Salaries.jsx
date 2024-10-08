import React, { useState, useEffect } from "react";
import { getData } from "../../helpers/api_methods";
import { useParams } from "react-router-dom";
import { RowHelper } from "../../helpers/RowHelper";

export const Salaries = ({ passedData = null }) => {

    const [data, setData] = useState(passedData)
    const { league_id, player_id } = useParams()

    useEffect(() => {
        getData(`leagues/${league_id}/players/${player_id}/salaries`, setData)
    }, [])

    console.log(data)

    const headers = <RowHelper items={['Player', 'Season', 'Value', 'Free Agent', 'Waiver Acquisition?', 'Waived?']} />

    const list = data?.map(object => <RowHelper key={object.id} items={[
        `${object.player.first_name} ${object.player.last_name}`, object.season.start_year, object.value,
        object.free_agent, object.waiver_acquisition, object.waived ]} />)

    return (
        data &&
        <div>
            {headers}
            {list}
        </div>
        
    )
}