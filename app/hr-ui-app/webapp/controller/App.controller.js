sap.ui.define([
  "sap/ui/core/mvc/Controller",
  "sap/ui/model/json/JSONModel",
  "sap/m/MessageToast"
], (BaseController,JSONModel,MessageToast) => {
  "use strict";

  return BaseController.extend("com.hr.hruiapp.controller.App", {
      onInit() {
        var oModel= new JSONModel({
          isVisible: true
        });

        this.getView().setModel(oModel); 

        },
       onNavDashboard: function () {
            MessageToast.show("Dashboard selected");
             this.getOwnerComponent().getRouter().navTo("dashboard");
        },
        onNavEmployees: function () {
            MessageToast.show("Clicked Employees");
            this.getOwnerComponent().getRouter().navTo("employees");
        },
        onNavAnal: function () {
            MessageToast.show("Clicked Anal");
            this.getOwnerComponent().getRouter().navTo("analytics");
        },
        onNavAttendance: function(){
          MessageToast.show("CLicked attendance");
          this.getOwnerComponent().getRouter().navTo("attendance");
        },
         onNotificationPress: function () {
            MessageToast.show("Notifications opened");
        },

         onMenuButtonPressed: function () {
            const oModel = this.getView().getModel();

            const isVisible = oModel.getProperty("/isVisible");

            oModel.setProperty("/isVisible", !isVisible);
        },

        onAvatarPress: function () {
            MessageToast.show("Profile menu opened");
        },

        onLogoutPress: function () {
            MessageToast.show("Logging out...");
        }

  });
});