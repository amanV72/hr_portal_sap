using UserService as service from '../../srv/service';

// ── OVP-specific annotations only (no duplicates from anaytics-demo) ──────────

annotate service.UserAnalytics with @(

    // ── LINE ITEM for Table Card ──────────────────────────────────────────────
    UI.LineItem #ovpTable: [
        { $Type: 'UI.DataFieldType', Value: gender,     Label: 'Gender'     },
        { $Type: 'UI.DataFieldType', Value: department,  Label: 'Department' },
        { $Type: 'UI.DataFieldType', Value: role,        Label: 'Role'       },
        { $Type: 'UI.DataFieldType', Value: is_active,   Label: 'Active'     },
        { $Type: 'UI.DataFieldType', Value: hire_date,   Label: 'Hire Date'  },
        { $Type: 'UI.DataFieldType', Value: userCount,   Label: 'Count'      }
    ],

    // ── CHARTS ────────────────────────────────────────────────────────────────
    UI.Chart #ovpByDepartment: {
        $Type          : 'UI.ChartDefinitionType',
        Title          : 'Users by Department',
        ChartType      : #Bar,
        Dimensions     : [department],
        DynamicMeasures: ['@Analytics.AggregatedProperty#totalUsers']
    },

    UI.Chart #ovpByGender: {
        $Type          : 'UI.ChartDefinitionType',
        Title          : 'Gender Distribution',
        ChartType      : #Donut,
        Dimensions     : [gender],
        DynamicMeasures: ['@Analytics.AggregatedProperty#totalUsers']
    },

    UI.Chart #ovpByRole: {
        $Type          : 'UI.ChartDefinitionType',
        Title          : 'Users by Role',
        ChartType      : #Donut,
        Dimensions     : [role],
        DynamicMeasures: ['@Analytics.AggregatedProperty#totalUsers']
    },

    // ── PRESENTATION VARIANTS ─────────────────────────────────────────────────
    UI.PresentationVariant #ovpByDepartment: {
        $Type          : 'UI.PresentationVariantType',
        SortOrder      : [{ Property: userCount, Descending: true }],
        Visualizations : ['@UI.Chart#ovpByDepartment']
    },

    UI.PresentationVariant #ovpByGender: {
        $Type          : 'UI.PresentationVariantType',
        SortOrder      : [{ Property: userCount, Descending: true }],
        Visualizations : ['@UI.Chart#ovpByGender']
    },

    UI.PresentationVariant #ovpByRole: {
        $Type          : 'UI.PresentationVariantType',
        SortOrder      : [{ Property: userCount, Descending: true }],
        Visualizations : ['@UI.Chart#ovpByRole']
    },

    UI.PresentationVariant #ovpTable: {
        $Type          : 'UI.PresentationVariantType',
        SortOrder      : [{ Property: userCount, Descending: true }],
        MaxItems       : 5,
        Visualizations : ['@UI.LineItem#ovpTable']
    },

    // ── SELECTION VARIANTS ────────────────────────────────────────────────────
    UI.SelectionVariant #activeOnly: {
        $Type        : 'UI.SelectionVariantType',
        SelectOptions: [{
            $Type       : 'UI.SelectOptionType',
            PropertyName: is_active,
            Ranges      : [{
                $Type : 'UI.SelectionRangeType',
                Sign  : #I,
                Option: #EQ,
                Low   : true
            }]
        }]
    },

    UI.SelectionVariant #allUsers: {
        $Type        : 'UI.SelectionVariantType',
        SelectOptions: []
    }

    // ── NO @title, NO @UI.DataPoint#totalUsersDP here ─────────────────────────
    // Those are already defined in app/anaytics-demo/annotations.cds
);