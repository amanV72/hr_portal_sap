const cds = require('@sap/cds');
const { INSERT } = require('@sap/cds/lib/ql/cds-ql');
const bcrypt = require('bcrypt');

module.exports = cds.service.impl(async function () {
  const { Users, Roles, Departments, LeaveRequests }= cds.entities('et');

  this.before(['CREATE', 'UPDATE'], 'Users', async (req) => {
    console.log(req.data);

  const {
    email,
    first_name,
    last_name,
    gender,
    phone,
    hire_date,
    role_id_ID,        
    department_id_ID  
  } = req.data;

  // Required fields
 function isEmpty(val) {
  return val === null || val === undefined || val === '';
}

if (
  isEmpty(email) ||
  isEmpty(first_name) ||
  isEmpty(last_name) ||
  isEmpty(gender) ||
  isEmpty(phone) ||
  isEmpty(hire_date) ||
  isEmpty(role_id_ID) ||
  isEmpty(department_id_ID)
) {
  return req.error(400, 'Please fill up all fields');
}

  //  Name validation
  const nameRegex = /^[A-Za-z ]+$/;
  if (!nameRegex.test(first_name)) {
    return req.error(400, 'First name should contain only letters');
  }
  if (!nameRegex.test(last_name)) {
    return req.error(400, 'Last name should contain only letters');
  }

  //  Phone validation
  const phoneRegex = /^[0-9]{10}$/;
  if (!phoneRegex.test(phone)) {
    return req.error(400, 'Phone must be 10 digits only');
  }

  //  Email validation
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) {
    return req.error(400, 'Invalid email format');
  }

  //  Validate role exists
  const roleExists = await SELECT.one.from(Roles).where({ ID: role_id_ID });
  if (!roleExists) {
    return req.error(400, 'Invalid role selected');
  }

  //  Validate department exists
  const deptExists = await SELECT.one.from(Departments).where({ ID: department_id_ID });
  if (!deptExists) {
    return req.error(400, 'Invalid department selected');
  }

  //  Fix associations
  req.data.role_id = { ID: role_id_ID };
  req.data.department_id = { ID: department_id_ID };

  delete req.data.role_id_ID;
  delete req.data.department_id_ID;

  //  Default value
  req.data.is_active = true;
});

this.before('CREATE', 'Roles', (req) => {

  const { name, description } = req.data;

  if (!name || !description) {
    return req.error(400, 'Please fill up all fields');
  }

});

this.before('CREATE', 'Departments', (req) => {

  const { name } = req.data;

  if (!name) {
    return req.error(400, 'Please fill up all fields');
  }
});


});

