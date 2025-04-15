const { DataTypes } = require("sequelize");
const sequelize = require("../libs/sequelizeInstance");

const EmployeType = sequelize.define(
  "EmployeType",
  {
    id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
    name: { type: DataTypes.STRING, allowNull: false },
    access: { type: DataTypes.INTEGER },
  },
  { timestamps: false }
);

module.exports = EmployeType;
