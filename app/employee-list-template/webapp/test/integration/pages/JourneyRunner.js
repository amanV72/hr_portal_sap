sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/hr/employeelisttemplate/test/integration/pages/UsersList",
	"com/hr/employeelisttemplate/test/integration/pages/UsersObjectPage"
], function (JourneyRunner, UsersList, UsersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/hr/employeelisttemplate') + '/test/flp.html#app-preview',
        pages: {
			onTheUsersList: UsersList,
			onTheUsersObjectPage: UsersObjectPage
        },
        async: true
    });

    return runner;
});

