namespace et;

using { cuid, managed } from '@sap/cds/common';

entity Roles: cuid {
    name: String(10);
    description: String(50)
}
entity Departments:cuid {
    name: String(10);
    manager: UUID
}

entity Users: cuid,managed {
    email: String(10);
    password_hash: String(8);
    first_name: String(10);
    last_name: String(10);
     role_id: Association to Roles;
     department_id: Association to Departments;
    hire_date: Date;
    phone: String(15); 
    is_active: Boolean;

}

