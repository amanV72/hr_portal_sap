sap.ui.define([
    "sap/ui/core/UIComponent",
    "com/hr/hruiapp/model/models"
], (UIComponent, models) => {
    "use strict";

    return UIComponent.extend("com.hr.hruiapp.Component", {
        metadata: {
            manifest: "json",
            interfaces: [
                "sap.ui.core.IAsyncContentCreation"
            ]
        },

        init() {
            // call the base component's init function
            UIComponent.prototype.init.apply(this, arguments);

              // initialize router
               this.getRouter().initialize();

        }
    });
});