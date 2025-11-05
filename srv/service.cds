using project1 as project1 from '../db/schema';

service CatalogService @(path: '/odata/v4/catalog'){
    entity ProductHeader as projection on project1.PRODUCT_HEADER;
        function getProductInfo(aName : String) returns array of LargeString;    
        action insertProductData(oID:UUID,oName:String(20),oStatus: String(10),oSupplier:String(20))
            returns String;

    entity PrItems as projection on project1.PR_ITEMS {
        *,
        LINK_TO_PRODUCT_HEADER : redirected to ProductHeader
    };
}
