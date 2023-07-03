using my.bookshop as bs from '../db/data-model';

 // Annotate Book elements
 annotate bs.Books with {
 ID     @title : 'Book ID';
 title  @title : 'Title';
 author  @title : 'Author';
 stock   @title : 'Stock';
 } 

// Annotate Author elements
 annotate bs.Authors with {
 ID @( 
      UI.Hidden,
      Common : {Text : name}
 ); 
name @title : 'Name';
books @title : 'Books';
 }

annotate bs.Books with {
   author @(Common : {
    //show text, not id for author in the context of books
    Text            : author.name,
    TextArrangement : #TextOnly,
    ValueList       : {
    Label          : 'Authors',
    CollectionPath : 'Authors',
    Parameters     : [
       {
       $Type : 'Common.ValueListParameterInOut',
       LocalDataProperty : author_ID,
       ValueListProperty : 'ID'
       },
       {
       $Type : 'Common.ValueListParameterDisplayOnly',
       ValueListProperty : 'descr'
       }
    ]
    }
  });


 }