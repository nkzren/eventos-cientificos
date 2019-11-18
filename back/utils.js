
/**
 * Formata o queryObj como uma string para o SET dos UPDATES do SQL
 * @param {Object} queryObj Objeto request.query das chamadas do Express
 */
const buildQuerySet = (queryObj) => {
    let keys = Object.keys(queryObj)
    return keys.reduce((result, e, i) => {
        return `${result},${e}=${queryObj[e]}`
    }, '').slice(1)
}

module.exports = {
    buildQuerySet
}