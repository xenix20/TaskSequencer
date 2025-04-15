const { DataTypes } = require("sequelize");
const sequelize = require("../libs/sequelizeInstance");

const Application = sequelize.define(
  "Application",
  {
    id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
    name: { type: DataTypes.STRING, allowNull: false },
    description: { type: DataTypes.STRING, allowNull: false },
    reason: { type: DataTypes.STRING, allowNull: true },
    declined: { type: DataTypes.BOOLEAN },
    relevance: { type: DataTypes.INTEGER },
    creation_date: { type: DataTypes.DATE },
    apply_date: { type: DataTypes.DATE },
    completed_date: { type: DataTypes.DATE },
  },
  { timestamps: false }
);

module.exports = Application;
