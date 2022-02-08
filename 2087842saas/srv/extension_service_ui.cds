using from '_base/app/index';
using CatalogService from './extensions';

annotate CatalogService.Sales with { 
    Z_city  @Common           : {SemanticObject : 'app_semobj', }  @readonly;
    country @readonly;
    region  @Common.ValueList : {
        $Type          : 'Common.ValueListType',
        CollectionPath : 'Z_Regions',
    };
    Z_to_clients;
}

annotate CatalogService.Sales with @(UI : {
    LineItem                : [
        ...,
        {
            Value : Z_city,
            Label : 'City_1'
        },
        {
            Value : Z_phone,
            Label : 'Phone'
        },
        {
            $Type           : 'UI.DataFieldForIntentBasedNavigation',
            SemanticObject  : 'models_semobj',
            Action          : 'manage',
            Label           : 'IntentNavigation',
            RequiresContext : true
        },
        {
            Value : Z_totalAmount,
            Label : 'Total Amount'
        },        
        {
            Value : Z_totalAmountWeight,
            Label : 'Total Weight'
        },
    ],

    FieldGroup #Details     : {Data : [
        ...,
        {
            Value : Z_city,
            Label : 'City'
        }, // extension field
        {
            Value : Z_phone,
            Label : 'Phone'
        }, // extension field
        {
            Value : Z_totalAmountWeight,
            Label : 'Total Weight'
        },
        {
            Value : Z_totalAmount,
            Label : 'Total Amount'
        },        
    ]},

    FieldGroup #Description : {Data : [
        ...,
        {
            Value : Z_city,
            Label : 'City'
        }, // extension field
        {
            Value : Z_phone,
            Label : 'Phone'
        }, // extension field
    ]}
});

annotate CatalogService.Products with @(UI : {
    LineItem             : [..., {
        Value : Z_weight,
        Label : 'Weight'
    }],

    FieldGroup #Details3 : {Data : [..., {
        Value : Z_weight,
        Label : 'Weight'
    }]}
});

annotate CatalogService.Products with {
    Z_weight       @title            : '{i18n>weight}';
    //Z_toUOM  @title : '{i18n>toUOM}';

    toProductGroup @Common.ValueList : {
        CollectionPath  : 'ProductGroups',
        Label           : 'Product Groups',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'toProductGroup_ID',
                ValueListProperty : 'ID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }
        ],
        SearchSupported : true
    };

    Z_toUOM        @Common.ValueList : {
        CollectionPath  : 'Z_UnitOfMesure',
        Label           : 'Product Groups',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'Z_toUOM_msehi',
                ValueListProperty : 'msehi'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }
        ],
        SearchSupported : true
    };
};
