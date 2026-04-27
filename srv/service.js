const cds = require('@sap/cds');
const { INSERT } = require('@sap/cds/lib/ql/cds-ql');
const bcrypt = require('bcrypt');

module.exports = cds.service.impl(async function () {
  const { Users }= cds.entities('et');

  this.on('add', async (req) => {
    
    const {
      email,
      password,
      first_name,
      last_name,
      phone,
      hire_date,
      role_ID,
      department_ID
    } = req.data;

   

    
 if (
      !email ||
      !password ||
      !first_name ||
      !last_name ||
      !phone ||
      !hire_date ||
      !role_ID ||
      !department_ID
    ) {
      req.error(400, 'Please fill up all fields');
    }


    
    const saltRounds = 10;
    const password_hash = await bcrypt.hash(password, saltRounds);

    const user = await INSERT.into(Users).entries({
      email,
      password_hash,           // ✅ only hash stored
      first_name,
      last_name,
      is_active: true,
      role_id_ID: role_ID,
      department_id_ID: department_ID
    });

    return user;

  });


});

