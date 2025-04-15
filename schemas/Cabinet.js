const { DataTypes } = require("sequelize");
const sequelize = require("../libs/sequelizeInstance");

const Cabinet = sequelize.define(
  "Cabinet",
  {
    id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
    name: { type: DataTypes.STRING, allowNull: false },
  },
  { timestamps: false }
);

module.exports = Cabinet;
