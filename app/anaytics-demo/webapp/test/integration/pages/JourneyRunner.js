sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/hr/anayticsdemo/test/integration/pages/UserAnalyticsList",
	"com/hr/anayticsdemo/test/integration/pages/UserAnalyticsObjectPage"
], function (JourneyRunner, UserAnalyticsList, UserAnalyticsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/hr/anayticsdemo') + '/test/flp.html#app-preview',
        pages: {
			onTheUserAnalyticsList: UserAnalyticsList,
			onTheUserAnalyticsObjectPage: UserAnalyticsObjectPage
        },
        async: true
    });

    return runner;
});

