import React from "react";

export const Error = ( {message = null}) => {

    return (
        <div className="error">
            { String(message) ?? 'Nothing Here!' }   
        </div>
    )
}