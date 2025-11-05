
const cds = require('@sap/cds');
module.exports = (srv => {
    const {
        PRODUCT_HEADER,
        PR_ITEMS
    } = cds.entities('project1');
    
    /* A Function to fetch Product data ***/
    srv.on('getProductInfo', async (req) => {      
        let aName=req.data.aName;
        let customerRequestsData;            
            return customerRequestsData = await cds.run(SELECT.from(PRODUCT_HEADER).where({
                    NAME: aName
            }));        
    });

    /** An action to perform insert opeartion in Product Data */
    srv.on("insertProductData", async (req)=>{
        let aSaveData = [];
        const {oID,oName,oStatus,oSupplier} = req.data;

        aSaveData.push({
            ID: oID,
            NAME: oName,
            DOM: '2008-02-14',
            INSTOCK: true,
            STATUS: oStatus,
            SUPPLIER: oSupplier
        });
        await INSERT.into(PRODUCT_HEADER).entries(aSaveData);
        return `Product : '${oName}' inserted successfully`
    });

});     