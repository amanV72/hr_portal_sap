using UserService as service from '../../srv/service';

annotate service.Users with @(

    UI.HeaderInfo : {
        TypeName : 'User',
        TypeNamePlural : 'Users',
        Title : {
            $Type : 'UI.DataField',
            Value : fullName,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : role_id.name,
        },
    },

    UI.CreateHidden : false,
    UI.DeleteHidden : false,

    // 🔥 FACETS (sections)
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PersonalInfo',
            Label : 'Personal Information',
            Target : '@UI.FieldGroup#Personal',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'WorkInfo',
            Label : 'Work Information',
            Target : '@UI.FieldGroup#Work',
        },
    ],

    // 🔥 PERSONAL SECTION
    UI.FieldGroup #Personal : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'First Name',
                Value : first_name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Last Name',
                Value : last_name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Gender',
                Value : gender,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Phone',
                Value : phone,
            },
        ],
    },

    // 🔥 WORK SECTION
    UI.FieldGroup #Work : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Hire Date',
                Value : hire_date,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Role',
                Value : role_id_ID,   // ✅ FIXED
            },
            {
                $Type : 'UI.DataField',
                Label : 'Department',
                Value : department_id_ID, // ✅ FIXED
            },
            {
                $Type : 'UI.DataField',
                Label : 'Active',
                Value : is_active,
            },
        ],
    },

    // 🔥 LIST REPORT TABLE
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : fullName,
            ![@HTML5.CssDefaults] : { width : '25%' },
        },
        {
            $Type : 'UI.DataField',
            Label : 'Gender',
            Value : gender,
            ![@HTML5.CssDefaults] : { width : '10%' },
        },
        {
            $Type : 'UI.DataField',
            Label : 'Email',
            Value : email,
            ![@HTML5.CssDefaults] : { width : '25%' },
        },
        {
            $Type : 'UI.DataField',
            Label : 'Phone',
            Value : phone,
            ![@HTML5.CssDefaults] : { width : '20%' },
        },
        {
            $Type : 'UI.DataField',
            Label : 'Role',
            Value : role_id.name,
            ![@HTML5.CssDefaults] : { width : '20%' },
        },
    ],
);




// 🔥 FIELD CONFIG + VALUE HELP
annotate service.Users with {
    role_id @(
        title                              : 'Role',
        Common.Text                        : role_id.name,
        Common.TextArrangement             : #TextOnly,
        Common.ValueListWithFixedValues    : true,
        Common.ValueList : {
            $Type          : 'Common.ValueListType',  // ✅ Add $Type
            CollectionPath : 'Roles',
            Parameters     : [
            
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
            ],
        },
    );
    department_id @(
        title                           : 'Department',
        Common.Text                     : department_id.name,
        Common.TextArrangement          : #TextOnly,
        Common.ValueListWithFixedValues : true,
        Common.ValueList : {
            $Type          : 'Common.ValueListType',  // ✅ Add $Type
            CollectionPath : 'Departments',
            Parameters     : [
            
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
            ],
        },
    );
};