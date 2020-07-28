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
package org.openmrs.module.hivtestingservices.api.db.hibernate;

import org.hibernate.SessionFactory;
import org.openmrs.api.db.hibernate.DbSessionFactory;
import org.openmrs.module.hivtestingservices.api.db.TagDAO;
import org.openmrs.module.hivtestingservices.model.MuzimaFormTag;

import java.util.List;

public class HibernateTagDAO implements TagDAO {
    private SessionFactory factory;

    public HibernateTagDAO(SessionFactory factory) {
        this.factory = factory;
    }

    public List<MuzimaFormTag> getAll() {
        return (List<MuzimaFormTag>) factory.getCurrentSession().createCriteria(MuzimaFormTag.class).list();
    }

    public void save(MuzimaFormTag tag) {
        factory.getCurrentSession().save(tag);
    }

}
