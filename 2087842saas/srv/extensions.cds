using CatalogService from '_base/srv/catalog-service';
using Z_pbsaaspoc1.db as db from '../db/new';
using Z_pbsaaspoc1.newfields as newfields from '../db/extend';

extend service CatalogService {

    entity Z_UnitOfMesure @(restrict : [{to : 'Viewer'}]) as select * from db.Z_UnitOfMesure;

    entity Z_Regions @(restrict : [{to : 'Viewer'}])      as select * from db.Z_Regions;
};
