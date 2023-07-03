using CatalogService as service from '../../srv/cat-service';

 // Book List Report Page
 annotate CatalogService.Books with @(UI : {
    HeaderInfo : {
       TypeName : 'Book',
       TypeNamePlural : 'Books',
       Title : {
          $Type : 'UI.DataField',
          Value : title
       },
       Description : {
          $Type : 'UI.DataField',
          Value : title
       }
    },
    SelectionFields : [title],
    Identification : [{Value : ID}],
    // Define the table columns
    LineItem : [
       {Value : title},
       {Value : author_ID},
       { 
          Value : stock,
          Criticality : criticality
       },
    ],
 });

 // Book Object Page
 annotate CatalogService.Books with @(UI : {
     Facets : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Main',
        Target : '@UI.FieldGroup#Main',
     }],
     FieldGroup #Main : {Data : [
       {Value : author_ID},
       {Value : title},
       {
           Value : stock,
           Criticality : criticality
       },
    ]},
 });