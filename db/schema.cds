using { cuid, managed } from '@sap/cds/common';

namespace bookshop;

entity Books : cuid, managed {
    title  : String(100);
    author : String(100);
    price  : Decimal(9,2);
    stock  : Integer;
}