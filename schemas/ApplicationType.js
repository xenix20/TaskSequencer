const { DataTypes } = require("sequelize");
const sequelize = require("../libs/sequelizeInstance");

const ApplicationType = sequelize.define(
  "ApplicationType",
  {
    id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
    name: { type: DataTypes.STRING, allowNull: false },
  },
  { timestamps: false }
);

module.exports = ApplicationType;
