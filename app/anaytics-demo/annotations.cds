using UserService as service from '../../srv/service';

annotate service.UserAnalytics with @(

    UI.LineItem: [
        { Value: gender,        Label: 'Gender'     },
        { Value: department,    Label: 'Department' },
        { Value: role,          Label: 'Role'       },
        { Value: is_active,     Label: 'Active'     },
        { Value: hire_date,     Label: 'Hire Date'  },
        { Value: userCount,     Label: 'Count'      }
    ],

    UI.Chart: {
        $Type          : 'UI.ChartDefinitionType',
        Title          : 'Users by Department',
        ChartType      : #Bar,
        Dimensions     : [department],
        DynamicMeasures: ['@Analytics.AggregatedProperty#totalUsers']
    },

    UI.Chart #genderDonut: {
        $Type          : 'UI.ChartDefinitionType',
        Title          : 'Gender Distribution',
        ChartType      : #Donut,
        Dimensions     : [gender],
        DynamicMeasures: ['@Analytics.AggregatedProperty#totalUsers']
    },

    UI.Chart #byRole: {
        $Type          : 'UI.ChartDefinitionType',
        Title          : 'Users by Role',
        ChartType      : #Donut,
        Dimensions     : [role],
        DynamicMeasures: ['@Analytics.AggregatedProperty#totalUsers']
    },

    // ── KPI ───────────────────────────────────────────────────────────────────
    UI.KPI #totalUsersKPI: {
        $Type    : 'UI.KPIType',
        DataPoint: '@UI.DataPoint#totalUsersDP',
        Detail   : {
            DefaultPresentationVariant: '@UI.PresentationVariant'
        }
    },

    UI.DataPoint #totalUsersDP: {
        $Type : 'UI.DataPointType',
        Value : userCount,
        Title : 'Total Users'
    },

    // ── DEFAULT Presentation Variant ──────────────────────────────────────────
    UI.PresentationVariant: {
        $Type          : 'UI.PresentationVariantType',
        SortOrder      : [{ Property: userCount, Descending: true }],
        Visualizations : ['@UI.Chart', '@UI.LineItem']
    },

    // ── SELECTION FIELDS ──────────────────────────────────────────────────────
    UI.SelectionFields: [
        gender,
        department,
        role,
        is_active,
        hire_date
    ],

    // ── ALL VIEWS — these appear in the "View By" dropdown ────────────────────
    UI.SelectionPresentationVariant #byDepartment: {
        $Type              : 'UI.SelectionPresentationVariantType',
        Text               : 'By Department',
        SelectionVariant   : { SelectOptions: [] },
        PresentationVariant: {
            $Type          : 'UI.PresentationVariantType',
            Visualizations : ['@UI.Chart', '@UI.LineItem'],
            SortOrder      : [{ Property: userCount, Descending: true }]
        }
    },

    UI.SelectionPresentationVariant #byGender: {
        $Type              : 'UI.SelectionPresentationVariantType',
        Text               : 'By Gender',
        SelectionVariant   : { SelectOptions: [] },
        PresentationVariant: {
            $Type          : 'UI.PresentationVariantType',
            Visualizations : ['@UI.Chart#genderDonut', '@UI.LineItem'],
            SortOrder      : [{ Property: userCount, Descending: true }]
        }
    },

    UI.SelectionPresentationVariant #byRole: {
        $Type              : 'UI.SelectionPresentationVariantType',
        Text               : 'By Role',
        SelectionVariant   : { SelectOptions: [] },
        PresentationVariant: {
            $Type          : 'UI.PresentationVariantType',
            Visualizations : ['@UI.Chart#byRole', '@UI.LineItem'],
            SortOrder      : [{ Property: userCount, Descending: true }]
        }
    },
);

annotate service.UserAnalytics with {
    ID         @title: 'ID';
    gender     @title: 'Gender';
    is_active  @title: 'Active';
    hire_date  @title: 'Hire Date';
    role       @title: 'Role';
    department @title: 'Department';
    userCount  @title: 'User Count';
}