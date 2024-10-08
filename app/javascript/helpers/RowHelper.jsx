import React from "react";

export const RowHelper = ({ items = null }) => {

    const count = items.length

    const row = items.map((item, idx) => <div key={idx} className="cell">{String(item)}</div>)

    return (
        <div className="listing" style={{ "gridTemplateColumns": `repeat(${count}, 1fr)` }}>
            {row}
        </div>
        
    )
}