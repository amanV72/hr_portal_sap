using { et } from '../db/schema';

service UserService  @(requires: 'authenticated-user'){
    @odata.draft.enabled
    @cds.redirection.target 
    entity Users as projection on et.Users{
        *,
        concat(first_name, ' ', last_name) as fullName : String
    };
    entity Roles as projection on et.Roles;
    entity Departments as projection on et.Departments;

    @readonly
    @Aggregation.ApplySupported: {
        Transformations: [
            'aggregate',
            'topcount',
            'bottomcount',
            'identity',
            'concat',
            'groupby',
            'filter',
            'expand',
            'search'
        ],
        GroupableProperties: [gender, is_active, hire_date, role, department],
        AggregatableProperties: [{
            $Type: 'Aggregation.AggregatablePropertyType',
            Property: userCount
        }]
    }
    @Analytics.AggregatedProperty #totalUsers: {
        $Type            : 'Analytics.AggregatedPropertyType',
        AggregatableProperty: userCount,
        AggregationMethod: 'sum',
        Name             : 'totalUsers',
        ![@Common.Label] : 'Total Users'
    }
    entity UserAnalytics as select from et.Users {
        key ID,
        gender,
        is_active,
        hire_date,
        role_id.name       as role       : String,
        department_id.name as department : String,
        cast(1 as Integer) as userCount  : Integer
            @Analytics.Measure              : true
            @Aggregation.default            : #SUM
    };

     // Gender Distribution ────────────────────────────────────────────────
    @readonly
    @Aggregation.ApplySupported: {
        Transformations: ['aggregate','groupby','filter','identity','concat','search'],
        GroupableProperties: [gender, department, role],
        AggregatableProperties: [{ $Type: 'Aggregation.AggregatablePropertyType', Property: genderCount }]
    }
    @Analytics.AggregatedProperty #totalByGender: {
        $Type: 'Analytics.AggregatedPropertyType',
        AggregatableProperty: genderCount,
        AggregationMethod: 'sum',
        Name: 'totalByGender',
        ![@Common.Label]: 'Users by Gender'
    }
    entity GenderAnalytics as select from et.Users {
        key ID,
        gender,
        department_id.name as department : String,
        role_id.name       as role       : String,
        cast(1 as Integer) as genderCount : Integer
            @Analytics.Measure : true
            @Aggregation.default : #SUM
    };
}