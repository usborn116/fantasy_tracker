import React from "react";
import { Link } from "react-router-dom";
import { Navigate } from "react-router-dom";
import { useNavigate } from "react-router-dom";

export const RowHelper = ({ items = null, url = null }) => {

    const count = items.length
    const navigate = useNavigate()

    console.log(url)

    const row = items.map((item, idx) => (
        <div key={idx} className="cell">{String(item)}</div>
    ))

    const navToResource = () => navigate(url)

    return (
        <div className={`listing ${url ? "clickable" : ''}`}
            onClick={() => navToResource()}
            style={{
                "gridTemplateColumns": `repeat(${count}, 1fr)`,
            }}>
            {row}
        </div>
        
    )
}