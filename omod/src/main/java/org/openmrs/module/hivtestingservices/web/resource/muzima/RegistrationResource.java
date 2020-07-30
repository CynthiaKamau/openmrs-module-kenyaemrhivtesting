/**
 * The contents of this file are subject to the OpenMRS Public License
 * Version 1.0 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://license.openmrs.org
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * Copyright (C) OpenMRS, LLC.  All Rights Reserved.
 */
package org.openmrs.module.hivtestingservices.web.resource.muzima;

import org.openmrs.Patient;
import org.openmrs.api.PatientService;
import org.openmrs.api.context.Context;
import org.openmrs.module.hivtestingservices.api.service.RegistrationDataService;
import org.openmrs.module.hivtestingservices.model.RegistrationData;
import org.openmrs.module.hivtestingservices.web.controller.MuzimaConstants;
import org.openmrs.module.hivtestingservices.web.resource.wrapper.FakePatient;
import org.openmrs.module.webservices.rest.web.RequestContext;
import org.openmrs.module.webservices.rest.web.RestConstants;
import org.openmrs.module.webservices.rest.web.annotation.Resource;
import org.openmrs.module.webservices.rest.web.representation.DefaultRepresentation;
import org.openmrs.module.webservices.rest.web.representation.FullRepresentation;
import org.openmrs.module.webservices.rest.web.representation.Representation;
import org.openmrs.module.webservices.rest.web.resource.impl.DataDelegatingCrudResource;
import org.openmrs.module.webservices.rest.web.resource.impl.DelegatingResourceDescription;
import org.openmrs.module.webservices.rest.web.response.ResourceDoesNotSupportOperationException;
import org.openmrs.module.webservices.rest.web.response.ResponseException;

/**
 * TODO: Write brief description about the class here.
 */
@Resource(name = MuzimaConstants.MUZIMA_NAMESPACE + "/registration",
        supportedClass = FakePatient.class,
        supportedOpenmrsVersions = {"1.8.*", "1.9.*","1.10.*","1.11.*","1.12.*","2.*"})
public class RegistrationResource extends DataDelegatingCrudResource<FakePatient> {
    /**
     * Gets the delegate object with the given unique id. Implementations may decide whether
     * "unique id" means a uuid, or if they also want to retrieve delegates based on a unique
     * human-readable property.
     *
     * @param uniqueId
     * @return the delegate for the given uniqueId
     */
    @Override
    public FakePatient getByUniqueId(final String uniqueId) {
        PatientService patientService = Context.getPatientService();
        RegistrationDataService registrationService = Context.getService(RegistrationDataService.class);

        RegistrationData registrationData = registrationService.getRegistrationDataByTemporaryUuid(uniqueId);
        Patient patient = patientService.getPatientByUuid(registrationData.getAssignedUuid());
        return FakePatient.copyPatient(patient);
    }

    /**
     * Void or retire delegate, whichever action is appropriate for the resource type. Subclasses
     * need to override this method, which is called internally by
     * {@link #delete(String, String, RequestContext)}.
     *
     * @param delegate
     * @param reason
     * @param context
     * @throws ResponseException
     *
     */
    @Override
    protected void delete(final FakePatient delegate, final String reason, final RequestContext context) throws ResponseException {
        throw new ResourceDoesNotSupportOperationException("Deleting patient using this resource is not supported.");
    }

    /**
     * Purge delegate from persistent storage. Subclasses need to override this method, which is
     * called internally by {@link #purge(String, RequestContext)}.
     *
     * @param delegate
     * @param context
     * @throws ResponseException
     *
     */
    @Override
    public void purge(final FakePatient delegate, final RequestContext context) throws ResponseException {
        throw new ResourceDoesNotSupportOperationException("Purging patient using this resource is not supported.");
    }

    /**
     * Instantiates a new instance of the handled delegate
     *
     * @return
     */
    @Override
    public FakePatient newDelegate() {
        throw new ResourceDoesNotSupportOperationException("Purging patient using this resource is not supported.");
    }

    /**
     * Writes the delegate to the database
     *
     * @return the saved instance
     */
    @Override
    public FakePatient save(final FakePatient delegate) {
        throw new ResourceDoesNotSupportOperationException("Saving patient using this resource is not supported.");
    }

    /**
     * Gets the {@link DelegatingResourceDescription} for the given representation for this
     * resource, if it exists
     *
     * @param rep
     * @return
     */
    @Override
    public DelegatingResourceDescription getRepresentationDescription(final Representation rep) {
        if (rep instanceof DefaultRepresentation) {
            DelegatingResourceDescription description = new DelegatingResourceDescription();
            description.addProperty("uuid");
            description.addProperty("gender");
            description.addProperty("birthdate");
            description.addProperty("birthdateEstimated");
            description.addProperty("names", Representation.REF);
            description.addProperty("identifiers", Representation.REF);
            description.addProperty("attributes", Representation.REF);
            description.addProperty("addresses", Representation.REF);
            description.addProperty("voided");
            description.addSelfLink();
            description.addLink("full", ".?v=" + RestConstants.REPRESENTATION_FULL);
            return description;
        } else if (rep instanceof FullRepresentation) {
            DelegatingResourceDescription description = new DelegatingResourceDescription();
            description.addProperty("uuid");
            description.addProperty("gender");
            description.addProperty("birthdate");
            description.addProperty("birthdateEstimated");
            description.addProperty("names", Representation.DEFAULT);
            description.addProperty("identifiers", Representation.DEFAULT);
            description.addProperty("attributes", Representation.DEFAULT);
            description.addProperty("addresses", Representation.DEFAULT);
            description.addProperty("voided");
            description.addProperty("auditInfo", findMethod("getAuditInfo"));
            description.addSelfLink();
            return description;
        }
        return null;
    }
}