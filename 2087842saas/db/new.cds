namespace Z_pbsaaspoc1.db;

using pbsaaspoc1.db from '_base/db/data-model.cds';

entity Z_UnitOfMesure {
    key msehi   : String(3) @(title : '{i18n>mesureCode}');
        dimid   : String(6) @(title : '{i18n>type}');
        isocode : String(3) @(title : '{i18n>ISOcode}');
        name    : String(30)@(title : '{i18n>name}');
};

entity Z_Regions {
    key region : String(25)@(title : '{i18n>region}');
};
