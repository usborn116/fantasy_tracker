import React, {useRef} from "react";
import { form_object } from "../helpers/form_helper";

export const Form = ({className = null, endpoint, item, updater, id = null, setError=null, setToggle, children}) => {

    const formRef = useRef()

    const onSubmit = async (e) =>{
        e.preventDefault()
        const formData=new FormData(formRef.current)
        const data=Object.fromEntries(formData)
        let info = form_object(item, {}, data)
        let response = await updater(`${endpoint}${id ? `/${id}` : ''}`, info, setError)
        if (info[item]?.name == '') response = null
        if (response?.error) return
        if (setToggle) setToggle(() => false)
    }

    return (
        <div className="form">
            <form className={className} ref={formRef} onSubmit={onSubmit}>
                {children}
            </form>
        </div>
          )
};