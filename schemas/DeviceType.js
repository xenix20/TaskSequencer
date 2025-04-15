const { DataTypes } = require("sequelize");
const sequelize = require("../libs/sequelizeInstance");

const DeviceType = sequelize.define(
  "DeviceType",
  {
    id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
    name: { type: DataTypes.STRING, allowNull: false },
  },
  { timestamps: false }
);

module.exports = DeviceType;
