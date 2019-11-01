const Sequelize = require('sequelize');
const { initConnection } = require('../config/mysql_conn');

const member = initConnection.define('member',
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    orgId: { type: Sequelize.INTEGER },
    name: { type: Sequelize.STRING },
    username: { type: Sequelize.STRING },
    imageUri: { type: Sequelize.STRING },
    followingCount: { type: Sequelize.INTEGER },
    followerCount: { type: Sequelize.INTEGER },
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

module.exports = member;
