namespace project1;
entity PRODUCT_HEADER {
    key ID: UUID;
    NAME: String(20);
    STATUS: String(10) default 'Active';
    SUPPLIER: String(20);
    DOM: Date;
    INSTOCK: Boolean default false;
    ITEMS                        : Composition of many PR_ITEMS on ITEMS.LINK_TO_PRODUCT_HEADER = $self;
}

entity PR_ITEMS {
    key PR_ITEMS_ID              : String(36);
    key ITEM                     : String(36);
    ITEM_NAME: String(50);
    TYPE_ITEM: String(10);
    STATUS_ITEM: String(10) default 'New';
    INSTOCK_ITEM: Boolean default false;
    LINK_TO_PRODUCT_HEADER      : Association[1..1] to PRODUCT_HEADER on LINK_TO_PRODUCT_HEADER.ID = PR_ITEMS_ID;
}    