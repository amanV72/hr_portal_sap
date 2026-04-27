using { et } from '../db/schema';

service UserService {

    entity Users as projection on et.Users {
        ID,
        email,
        first_name,
        last_name,
        phone,
        hire_date,
        is_active,
        role_id,
        department_id
    };
    action add(
        email        : String,
        password     : String,
        first_name   : String,
        last_name    : String,
        phone        : String,
        hire_date    : Date,
        role_ID      : UUID,
        department_ID: UUID
    ) returns Users;
}
