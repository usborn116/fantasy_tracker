export const form_object = (item, info, data) => {

    if(item == 'login'){info['user'] = { email: data.email, password: data.password }}
    if(item == 'signup'){info['user'] = { name: data.name, email: data.email, 
        password: data.password, password_confirmation: data.password_confirmation }}
    if(item == 'search'){info['last_name'] = data.last_name }
    return info
}