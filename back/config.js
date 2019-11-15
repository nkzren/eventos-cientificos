require('dotenv').config();

const { Pool } = require('pg');

const isProduction = process.env.NODE_ENV !== 'production'

const pool = new Pool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD,
    port: 5432,
    ssl: true,
})

module.exports = { pool }