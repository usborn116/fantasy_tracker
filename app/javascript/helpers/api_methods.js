export const getData = async (endpoint, setter) => {
    const response = await fetch(`/api/${endpoint}`)
    const data = await response.json()
    setter(data)
}