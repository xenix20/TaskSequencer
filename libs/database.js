const path = require("path");
const fs = require("fs");
const sequelize = require("./sequelizeInstance");

const Schemas = {};

const modelsDir = path.join(__dirname, "..\\schemas");
fs.readdirSync(modelsDir)
  .filter((file) => file.endsWith(".js"))
  .forEach((file) => {
    const model = require(path.join(modelsDir, file));
    Schemas[model.name] = model;
  });

const {
  Employe,
  EmployeType,
  Cabinet,
  Application,
  ApplicationType,
  DeviceType,
} = Schemas;

if (Employe && EmployeType && Cabinet) {
  Employe.belongsTo(EmployeType, { foreignKey: "employe_type" });
  Employe.belongsTo(Cabinet, { foreignKey: "cabinet" });
}

if (Application && ApplicationType && DeviceType && Employe && Cabinet) {
  Application.belongsTo(ApplicationType, { foreignKey: "application_type" });
  Application.belongsTo(DeviceType, { foreignKey: "device_type" });
  Application.belongsTo(Employe, { foreignKey: "worked_by", as: "WorkedBy" });
  Application.belongsTo(Employe, { foreignKey: "created_by", as: "CreatedBy" });
  Application.belongsTo(Cabinet, { foreignKey: "cabinet" });
}

module.exports = { sequelize, Schemas };
