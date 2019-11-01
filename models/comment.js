const Sequelize = require('sequelize');
const { initConnection } = require('../config/mysql_conn');

const comment = initConnection.define('comment',
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    orgId: { type: Sequelize.INTEGER },
    description: { type: Sequelize.STRING },
    createdAt: { type: Sequelize.DATE, defaultValue: Sequelize.NOW },
    updatedAt: { type: Sequelize.DATE },
    deletedAt: { type: Sequelize.DATE },
  },
  {
    timestamps: true,
    freezeTableName: true,
    paranoid: true,
  }
);

module.exports = comment;
