namespace et;

using { cuid, managed } from '@sap/cds/common';

entity Roles: cuid {
    name: String(10);
    description: String(50)
}
entity Departments:cuid {
    name: String(10);
    key department_head: Association to Users;
}

entity Users: cuid,managed {
    email: String(10);
    password_hash: String(8);
    first_name: String(10);
    last_name: String(10);
    key role_id: Association to Roles;
    key department_id: Association to Departments;
    hire_date: Date;
    phone: String(15); 
    is_active: Boolean;
}

