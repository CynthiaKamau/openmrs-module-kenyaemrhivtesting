<%
	ui.decorateWith("kenyaemr", "standardPage", [ patient: currentPatient, layout: "sidebar" ])
%>
<style>
div.grid      { display:block; }
div.grid div  { float: left; height: 30px; }
div.column-one    { width: 300px; }
div.column-two    { width: 100px; }
div.column-three    { width: 120px; }
div.column-four      { width: 120px; }
div.column-five       { width: 120px; }
div.column-six       { width: 100px; }
div.clear     { clear: both; }
.col-header {font-weight: bold; font-size: 14px;}
div.section-title {
    color: black;
    font-weight: bold;
    display: block;
    width: 550px;
    float: left;
    font-size: 16px;
}
.line-separator {
    height: 1px;
    background: #717171;
    border-bottom:1px solid #313030;
}
</style>
<script type="text/javascript">

</script>

<div class="ke-page-sidebar">
	<div class="ke-panel-frame">
		${ ui.includeFragment("kenyaui", "widget/panelMenuItem", [ iconProvider: "kenyaui", icon: "buttons/back.png", label: "Back", href: returnUrl ]) }
	</div>
</div>

<div class="ke-page-content">
	<div class="ke-panel-frame">
		<div class="ke-panel-heading">Family/Partner Tree </div>
		<div class="ke-panel-content">
            <div class="section-title">Contacts Testing Statistics</div><div class="clear"></div>
            <div class="grid">
                <div class="column-one">&nbsp;</div>
                <div class="column-two col-header">Total</div>
                <div class="column-three col-header">Known Status</div>
                <div class="column-four col-header">Positive</div>
                <div class="column-five col-header">Linked</div>
            </div>
            <div class="clear"></div>
            <div class="grid">
                <div class="column-one">&nbsp;</div>
                <div class="column-two col-header">${stats.totalContacts}</div>
                <div class="column-three col-header">${stats.knownPositives}</div>
                <div class="column-four col-header">${stats.positiveContacts}</div>
                <div class="column-five col-header">${stats.linkedPatients}</div>
            </div>
            <div class="clear"></div>
            <div class="line-separator"></div>

        <div class="section-title">Contacts Enrolled in the facility (In Care)</div><div class="clear"></div>
			<% if (enrolledRelationships) { %>
            <div class="grid">
                <div class="column-one">&nbsp;</div>
                <div class="column-two col-header">Age</div>
                <div class="column-three col-header">Date Confirmed</div>
                <div class="column-four col-header">Date Enrolled</div>
                <div class="column-five col-header">ART No</div>
                <div class="column-six col-header">Status</div>
            </div>
            <div class="clear"></div>
			<% enrolledRelationships.each { rel -> %>
			<div class="ke-stack-item">
                <div class="grid">
                    <div class="column-one">
                        ${ ui.includeFragment("kenyaui", "widget/dataPoint", [ label: ui.format(rel.type), value: rel.personLink ]) }
                    </div>
                    <div class="column-two">${rel.age}</div>
                    <div class="column-three">${rel.dateConfirmed}</div>
                    <div class="column-four">${rel.dateEnrolled}</div>
                    <div class="column-five">${rel.art_no}</div>
                    <div class="column-six">${rel.status}</div>
                </div>
                <div class="clear"></div>


			</div>
			<% } } else {%>
            No record was found
			<% } %>
		</div>
        <div class="line-separator"></div>

        <div class="ke-panel-content">
            <div class="section-title">Contacts registered in this facility (Not in Care)</div><div class="clear"></div>
            <% if (registeredContacts) { %>
            <div class="grid">
                <div class="column-one">&nbsp;</div>
                <div class="column-two col-header">Age</div>
                <div class="column-three col-header">Last Test Date</div>
                <div class="column-four col-header">Test Result</div>
                <div class="column-five col-header">In Care</div>
                <div class="column-six col-header">UPN</div>
            </div>
            <div class="clear"></div>
            <% registeredContacts.each { rel -> %>
            <div class="ke-stack-item">
                <div class="grid">
                    <div class="column-one">
                        ${ ui.includeFragment("kenyaui", "widget/dataPoint", [ label: ui.format(rel.type), value: rel.personLink ]) }
                    </div>
                    <div class="column-two">${rel.age}</div>
                    <div class="column-three">${rel.lastTestDate}</div>
                    <div class="column-four">${rel.lastTestResult}</div>
                    <div class="column-five">${rel.inCare}</div>
                    <div class="column-six">${rel.upn}</div>
                </div>
                <div class="clear"></div>

            </div>
            <% } } else {%>
            No record was found
            <% } %>
        </div>
        <div class="line-separator"></div>
        <div class="ke-panel-content">
            <div class="section-title">Contacts not registered in the facility</div><div class="clear"></div>
            <% if (otherContacts) { %>
            <div class="grid">
                <div class="column-one">&nbsp;</div>
                <div class="column-two col-header">Age</div>
                <div class="column-three col-header">Baseline Status</div>
                <div class="column-four col-header">In Care</div>
                <div class="column-five col-header">Facility</div>
                <div class="column-six col-header">UPN</div>
                <div class="column-five col-header">Appointment Date</div>
            </div>
            <div class="clear"></div>
            <% otherContacts.each { rel -> %>
            <div class="ke-stack-item">
                <div class="grid">
                    <div class="column-one">
                        ${ ui.includeFragment("kenyaui", "widget/dataPoint", [ label: ui.format(rel.relationType), value: rel.fullName ]) }
                    </div>
                    <div class="column-two">${rel.age}</div>
                    <div class="column-three">${rel.baselineHivStatus}</div>
                    <div class="column-four">${rel.inCare}</div>
                    <div class="column-five">${rel.facilityLinkedTo}</div>
                    <div class="column-six">${rel.upn}</div>
                    <div class="column-five">${rel.appointmentDate}</div>
                </div>
                <div class="clear"></div>

            </div>
            <% } } else {%>
            No record was found
            <% } %>
        </div>
        <div class="line-separator"></div>

	</div>
</div>