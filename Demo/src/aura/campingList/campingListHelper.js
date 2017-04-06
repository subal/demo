({
    createItem: function(component, item) {
        /*var theItems = component.get("v.items");
 
        // Copy the expense to a new object
        // THIS IS A DISGUSTING, TEMPORARY HACK
        var newItem = JSON.parse(JSON.stringify(item));
 
        theItems.push(newItem);
        component.set("v.items", theItems); */
      console.log('in create item');          
    var action = component.get("c.saveItem");
    action.setParams({
        "newItem": item
    });
    action.setCallback(this, function(response){
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            var items = component.get("v.items");
            items.push(response.getReturnValue());
            component.set("v.items", items);
        }
    });
    $A.enqueueAction(action);
},
    
    
    
})