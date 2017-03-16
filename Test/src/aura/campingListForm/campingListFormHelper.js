({
	validateCampingForm: function(component) {

    var validItem = true;
        
        //  get and verify the name is set
        var nameField = component.find("campItemName");
        var campname = nameField.get("v.value");
        if ($A.util.isEmpty(campname))
        {
            validItem = false;
            nameField.set("v.errors", [{message: "Camping Item name can't be blank."}]);
        }
        else
        {
            nameField.set("v.errors", null);
        }
        
        //  check quantity
        var quantityField = component.find("quantity");
        var quantityValue = quantityField.get("v.value");
        if ($A.util.isEmpty(quantityValue) || quantityValue == 0)
        {
            validItem = false;
            quantityField.set("v.errors", [{message : "Quantity cannot be 0 or blank."}]);
        }
        else
        {
            quantityField.set("v.errors", null);
        }
        
        //  check price
        var priceField = component.find("price");
        var priceValue = priceField.get("v.value");
        if ($A.util.isEmpty(priceValue) || priceValue == 0)
        {
            validItem = false;
            priceField.set("v.errors", [{message : "Price cannot be 0 or blank."}]);
        }
        else
        {
            priceField.set("v.errors", null);
        }

    return(validItem);
},

 createItem : function(component, newItem) {
  console.log("Fire createItem");
    var createEvent = component.getEvent("addItem");
    createEvent.setParams({ "item": newItem });
    createEvent.fire();
    component.set("v.newItem",{'sobjectType':'Camping_Item__c',
                'Name': '',
                'Quantity__c': 0,
                'Price__c': 0,
                'Packed__c': false})
    
}
})