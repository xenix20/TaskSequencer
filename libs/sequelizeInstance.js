const { Sequelize } = require("sequelize");
const config = require("../config/config.json").production;

const sequelize = new Sequelize(
  config.database,
  config.username,
  config.password,
  {
    host: config.host,
    dialect: config.dialect,
    define: { freezeTableName: true },
    dialectOptions: { charset: "utf8", ssl: false },
    logging: false,
  }
);

module.exports = sequelize;
