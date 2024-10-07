import React from "react";

export const Error = ( {status = null}) => {

    return (
        <div className="error">
            {status ?
                String(status) :
                'Nothing Here!'
            }   
        </div>
    )
}