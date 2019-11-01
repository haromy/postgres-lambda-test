const Sequelize = require('sequelize');

const connection = new Sequelize(
  process.env.POSTGRES_DB_NAME,
  process.env.POSTGRES_DB_USER,
  process.env.POSTGRES_DB_PASS, {
    host: process.env.POSTGRES_DB_HOST,
    dialect: 'postgres',
    port: process.env.POSTGRES_DB_PORT,
    logging: false,
    dialectOptions: {
      encrypt: true
    },
    pool: {
      max: 5,
      min: 0,
      acquire: 30000,
      idle: 10000
    },
    operatorAliases: false
  }
);

module.exports = { initConnection: connection };
