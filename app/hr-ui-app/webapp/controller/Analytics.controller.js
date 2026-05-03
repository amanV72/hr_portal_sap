sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/m/MessageToast"
], function (Controller, JSONModel, MessageToast) {
    "use strict";

    return Controller.extend("com.hr.hruiapp.controller.Analytics", {

        onInit: function () {
            const oModel = new JSONModel(this._getDummyData());
            this.getView().setModel(oModel);
        },

        _getDummyData: function () {
            return {

                // Bar chart — headcount per department
                headcountData: [
                    { department: "Engineering",  employees: 72 },
                    { department: "Sales",        employees: 45 },
                    { department: "Product",      employees: 28 },
                    { department: "HR",           employees: 18 },
                    { department: "Design",       employees: 22 },
                    { department: "Analytics",    employees: 35 },
                    { department: "Operations",   employees: 27 }
                ],

                // Donut chart — gender distribution
                genderData: [
                    { gender: "Male",           count: 138 },
                    { gender: "Female",         count: 97  },
                    { gender: "Non-binary",     count: 8   },
                    { gender: "Prefer not say", count: 4   }
                ],

                // Line chart — monthly hiring vs attrition
                hiringAttritionData: [
                    { month: "Oct", hired: 12, attrited: 5 },
                    { month: "Nov", hired: 8,  attrited: 7 },
                    { month: "Dec", hired: 5,  attrited: 9 },
                    { month: "Jan", hired: 15, attrited: 4 },
                    { month: "Feb", hired: 18, attrited: 6 },
                    { month: "Mar", hired: 14, attrited: 5 }
                ],

                // Stacked bar — leave utilization by department
                leaveData: [
                    { department: "Engineering", sickLeave: 18, annualLeave: 42, other: 8 },
                    { department: "Sales",       sickLeave: 12, annualLeave: 35, other: 5 },
                    { department: "Product",     sickLeave: 7,  annualLeave: 28, other: 4 },
                    { department: "HR",          sickLeave: 5,  annualLeave: 20, other: 3 },
                    { department: "Design",      sickLeave: 6,  annualLeave: 24, other: 2 },
                    { department: "Analytics",   sickLeave: 9,  annualLeave: 30, other: 6 }
                ],

                // Summary table
                departmentSummary: [
                    { department: "Engineering", headcount: 72, newHires: 8, attrition: 4.2, attritionState: "Success", tenure: 3.8, openRoles: 5, openRolesState: "Warning", satisfaction: 4.2 },
                    { department: "Sales",       headcount: 45, newHires: 5, attrition: 9.8, attritionState: "Error",   tenure: 2.1, openRoles: 4, openRolesState: "Warning", satisfaction: 3.5 },
                    { department: "Product",     headcount: 28, newHires: 3, attrition: 3.6, attritionState: "Success", tenure: 4.1, openRoles: 2, openRolesState: "None",    satisfaction: 4.5 },
                    { department: "HR",          headcount: 18, newHires: 1, attrition: 5.5, attritionState: "Warning", tenure: 3.2, openRoles: 1, openRolesState: "None",    satisfaction: 4.0 },
                    { department: "Design",      headcount: 22, newHires: 2, attrition: 4.0, attritionState: "Success", tenure: 2.9, openRoles: 2, openRolesState: "None",    satisfaction: 4.3 },
                    { department: "Analytics",   headcount: 35, newHires: 6, attrition: 6.1, attritionState: "Warning", tenure: 2.5, openRoles: 3, openRolesState: "Warning", satisfaction: 3.8 },
                    { department: "Operations",  headcount: 27, newHires: 2, attrition: 7.4, attritionState: "Error",   tenure: 3.0, openRoles: 1, openRolesState: "None",    satisfaction: 3.6 }
                ]
            };
        },

        onPeriodChange: function (oEvent) {
            MessageToast.show("Loading data for: " + oEvent.getParameter("selectedItem").getText());
        },

        onExport: function () {
            MessageToast.show("Exporting analytics report...");
        }

    });
});