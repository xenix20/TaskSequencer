const { sequelize, Schemas } = require("./libs/database");

const express = require("express");
const cors = require("cors");
const app = express();
app.use(cors());
const port = 3000;
app.use(express.json());

app.get("/employes", async (req, res) => {
  const applications = await Schemas.Employe.findAll({
    include: [{ model: Schemas.Cabinet }],
  });

  res.json(applications);
});

app.get("/employe_types", async (req, res) => {
  const applications = await Schemas.EmployeType.findAll({});

  res.json(applications);
});

app.get("/employe/:id", async (req, res) => {
  const applications = await Schemas.Employe.findOne({
    include: [{ model: Schemas.Cabinet }],
    where: { id: req.params.id },
  });

  res.json(applications);
});

app.post("/employe", async (req, res) => {
  const applications = await Schemas.Employe.create({
    firstname: req.body.firstname,
    lastname: req.body.lastname,
    surname: req.body.surname,
    password: "123",
    email: req.body.email,
    cabinet: req.body.cabinet,
    employe_type: req.body.employe_type,
  });
  res.json({ ok: 1 });
});
app.put("/employe/:id", async (req, res) => {
  const applications = await Schemas.Employe.update(
    {
      firstname: req.body.firstname,
      lastname: req.body.lastname,
      surname: req.body.surname,
      email: req.body.email,
      cabinet: req.body.cabinet,
    },
    {
      where: { id: req.params.id },
    }
  );
  res.json({ ok: 1 });
});

app.delete("/employe/:id", async (req, res) => {
  const applications = await Schemas.Employe.destroy({
    where: {
      id: req.params.id,
    },
  });

  res.json({ ok: 1 });
});

app.post("/device", async (req, res) => {
  const jane = await Schemas.DeviceType.create({
    name: req.body.name,
  });
  res.json("applications");
});

app.delete("/device/:id", async (req, res) => {
  const applications = await Schemas.DeviceType.destroy({
    where: {
      id: req.params.id,
    },
  });

  res.json({ ok: 1 });
});

app.put("/device/:id", async (req, res) => {
  const jane = await Schemas.DeviceType.update(
    {
      name: req.body.name,
    },
    { where: { id: req.params.id } }
  );
  res.json("applications");
});

app.post("/cabinet", async (req, res) => {
  const jane = await Schemas.Cabinet.create({
    name: req.body.name,
  });
  res.json("applications");
});

app.delete("/cabinet/:id", async (req, res) => {
  const applications = await Schemas.Cabinet.destroy({
    where: {
      id: req.params.id,
    },
  });

  res.json({ ok: 1 });
});

app.put("/cabinet/:id", async (req, res) => {
  const jane = await Schemas.Cabinet.update(
    {
      name: req.body.name,
    },
    { where: { id: req.params.id } }
  );
  res.json("applications");
});

app.get("/applicationTypes", async (req, res) => {
  const applications = await Schemas.ApplicationType.findAll({});
  res.json(applications);
});

app.get("/device/:id", async (req, res) => {
  const applications = await Schemas.DeviceType.findOne({
    where: { id: req.params.id },
  });
  res.json(applications);
});
app.get("/cabinet/:id", async (req, res) => {
  const applications = await Schemas.Cabinet.findOne({
    where: { id: req.params.id },
  });
  res.json(applications);
});

app.get("/cabinets", async (req, res) => {
  const applications = await Schemas.Cabinet.findAll({});
  res.json(applications);
});
app.get("/deviceTypes", async (req, res) => {
  const applications = await Schemas.DeviceType.findAll({});
  res.json(applications);
});

app.post("/task", async (req, res) => {
  const jane = await Schemas.Application.create({
    name: req.body.name,
    description: req.body.description,
    relevance: req.body.relevance,
    application_type: req.body.applicationType,
    created_by: req.body.created_by,
    creation_date: new Date(),
    reason: null,
    device_type: req.body.deviceType,
    cabinet: req.body.cabinet,
  });
  res.json("applications");
});

app.put("/task/:id", async (req, res) => {
  const jane = await Schemas.Application.update(
    {
      name: req.body.name,
      description: req.body.description,
      relevance: req.body.relevance,
      application_type: req.body.applicationType,
      device_type: req.body.deviceType,
      cabinet: req.body.cabinet,
    },
    { where: { id: req.params.id } }
  );
  res.json("applications");
});

app.post("/task/:id/decline", async (req, res) => {
  await Schemas.Application.update(
    { declined: 1, reason: req.body.reason },
    {
      where: {
        id: req.params.id,
      },
    }
  );
  res.json({ ok: 1 });
});

app.post("/task/:id/accept", async (req, res) => {
  console.log(
    await Schemas.Application.update(
      { apply_date: new Date(), worked_by: req.body.by },
      {
        where: {
          id: req.params.id,
        },
      }
    )
  );
  res.json({ ok: 1 });
});

app.post("/task/:id/complete", async (req, res) => {
  await Schemas.Application.update(
    { completed_date: new Date() },
    {
      where: {
        id: req.params.id,
      },
    }
  );
  res.json({ ok: 1 });
});

app.post("/login", async (req, res) => {
  try {
    const applications = await Schemas.Employe.findOne({
      where: {
        lastname: req.body.login,
        password: req.body.password,
      },
      include: [
        { model: Schemas.Cabinet },
        { model: Schemas.EmployeType, as: "EmployeType" },
      ],
    });

    res.json(applications);
  } catch {
    res.json(null);
  }
});

app.delete("/task/:id", async (req, res) => {
  const applications = await Schemas.Application.destroy({
    where: {
      id: req.params.id,
    },
  });

  res.json({ ok: 1 });
});
app.get("/task/:id", async (req, res) => {
  const applications = await Schemas.Application.findOne({
    where: {
      id: req.params.id,
    },
    include: [
      { model: Schemas.ApplicationType },
      { model: Schemas.DeviceType },
      { model: Schemas.Cabinet },
      { model: Schemas.Employe, as: "WorkedBy" },
      { model: Schemas.Employe, as: "CreatedBy" },
    ],
  });

  res.json(applications);
});

app.get("/tasks", async (req, res) => {
  const applications = await Schemas.Application.findAll({
    include: [
      { model: Schemas.ApplicationType },
      { model: Schemas.DeviceType },
      { model: Schemas.Cabinet },
      { model: Schemas.Employe, as: "WorkedBy" },
      { model: Schemas.Employe, as: "CreatedBy" },
    ],
  });

  res.json(applications);
});

(async () => {
  try {
    await sequelize.authenticate();
    console.log("succresfuly connected to db");

    app.listen(port, () => {
      console.log(`Example app listening on port ${port}`);
    });
  } catch (err) {
    console.error("Application handled an error:", err);
  }
})();
