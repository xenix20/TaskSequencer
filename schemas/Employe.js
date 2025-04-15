const { DataTypes } = require("sequelize");
const sequelize = require("../libs/sequelizeInstance");

const Employe = sequelize.define(
  "Employe",
  {
    id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
    firstname: { type: DataTypes.STRING, allowNull: false },
    lastname: { type: DataTypes.STRING, allowNull: false },
    surname: { type: DataTypes.STRING },
    password: { type: DataTypes.STRING, allowNull: false },
    email: { type: DataTypes.STRING, allowNull: false },
  },
  { timestamps: false }
);

module.exports = Employe;
