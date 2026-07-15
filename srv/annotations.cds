using CatalogService from './catalog-service';

annotate CatalogService.Books with @(
    UI.HeaderInfo : {
        TypeName       : 'Book',
        TypeNamePlural : 'Books',
        Title          : {
            Value : title
        }
    },

    UI.LineItem : [
        { Value : title },
        { Value : author },
        { Value : price },
        { Value : stock }
    ]
);