using my.bookshop as my from '../db/data-model';

service CatalogService {
  entity Books as projection on my.Books;

  annotate Books with @odata.draft.enabled;
  
  entity Authors @(restrict : [
            {
                grant : [ 'READ' ],
                to : [ 'BookshopViewer' ]
            },
            {
                grant : [ '*' ],
                to : [ 'RiskManager' ]
            }
        ]) as projection on my.Authors;

  entity Orders @insertonly as projection on my.Orders;
}
annotate CatalogService with @(requires: ['BookshopAdmin']);
