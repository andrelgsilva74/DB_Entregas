import mysql from 'mysql';

//Conexão com o Banco
const db = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "Missoes@3$%",
    database: "DerivMarket"
});

export default db;