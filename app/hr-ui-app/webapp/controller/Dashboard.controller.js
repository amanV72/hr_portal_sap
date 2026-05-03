sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/m/MessageToast"
], function (Controller, JSONModel, MessageToast) {
    "use strict";

    return Controller.extend("com.hr.hruiapp.controller.Dashboard", {

        onInit: function () {
            var oDashboardModel = new JSONModel({
                recentActivities: [
                    {
                        description: "Sarah Jenkins requested sick leave",
                        timestamp: "2m ago",
                        statusText: "pending",
                        statusState: "Warning"
                    },
                    {
                        description: "Michael Chen checked in late",
                        timestamp: "15m ago",
                        statusText: "alert",
                        statusState: "Error"
                    },
                    {
                        description: "Emma Wilson completed onboarding",
                        timestamp: "1h ago",
                        statusText: "success",
                        statusState: "Success"
                    }
                ],
                pendingApprovals: [
                    {
                        employeeId: "E001",
                        employeeName: "Sarah Jenkins",
                        leaveType: "Sick Leave",
                        duration: "3 days"
                    },
                    {
                        employeeId: "E002",
                        employeeName: "David Kim",
                        leaveType: "Annual Leave",
                        duration: "5 days"
                    }
                ]
            });

            this.getView().setModel(oDashboardModel);
        },

   
        onApprove: function (oEvent) {
            var sEmployeeId = oEvent.getSource().data("employeeId");
            MessageToast.show("Approved request for employee: " + sEmployeeId);
            // Call OData service to approve
        },

        onReject: function (oEvent) {
            var sEmployeeId = oEvent.getSource().data("employeeId");
            MessageToast.show("Rejected request for employee: " + sEmployeeId);
            // Call OData service to reject
        },

       
    });
});