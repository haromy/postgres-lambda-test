const Sequelize = require('sequelize');
const { initConnection } = require('../config/mysql_conn');

const org = initConnection.define('org', {
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  name: { type: Sequelize.STRING },
  createdAt: { type: Sequelize.DATE, defaultValue: Sequelize.NOW },
  updatedAt: { type: Sequelize.DATE },
},
{
  timestamps: false,
  freezeTableName: true
});

module.exports = org;
