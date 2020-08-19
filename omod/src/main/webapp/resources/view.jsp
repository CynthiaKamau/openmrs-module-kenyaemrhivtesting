<%@ include file="/WEB-INF/template/include.jsp" %>
<%@ include file="/WEB-INF/template/header.jsp" %>

<openmrs:require privilege="Edit Patients" otherwise="/login.htm" redirect="/module/hivtestingservices/view.list"/>

<openmrs:htmlInclude file="/moduleResources/hivtestingservices/styles/font-awesome/css/font-awesome.min.css"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/styles/animate/animate.css"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/styles/bootstrap/css/bootstrap.css"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/styles/custom/custom.css"/>

<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/jquery/jquery.js" />
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/lodash/lodash.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/styles/bootstrap/js/bootstrap.min.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/angular/angular.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/angular/angular-route.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/angular/angular-resource.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/angular/angular-sanitize.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/ui-bootstrap/ui-bootstrap-2.0.0.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/ui-bootstrap/ui-bootstrap-tpls-2.0.0.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/angular/angular-strap.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/custom/filters.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/custom/app.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/custom/controllers/EditController.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/custom/controllers/ErrorController.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/custom/controllers/FormController.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/custom/controllers/ImportController.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/custom/controllers/QueueController.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/custom/controllers/RegistrationController.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/custom/controllers/SourceController.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/custom/controllers/UpdateController.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/custom/controllers/XFormsController.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/custom/controllers/ConfigController.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/custom/controllers/SettingController.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/custom/controllers/ReportConfigurationController.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/custom/controllers/CohortDefinitionController.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/custom/controllers/MergeController.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/custom/directives/fileUpload.js"/>
<openmrs:htmlInclude file="/moduleResources/hivtestingservices/js/custom/directives/sideNav.js"/>

<h3><spring:message code="hivtestingservices.title"/></h3>
<div class="bootstrap-scope" ng-app="hivtestingservicesModule">
    <div ng-view ></div>
</div>

<%@ include file="/WEB-INF/template/footer.jsp" %>