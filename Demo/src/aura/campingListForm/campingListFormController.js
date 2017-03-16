({
	submitForm  : function(component, event, helper) {
		   if (helper.validateCampingForm(component))
        {
            var newItemRef = component.get("v.newItem");
            //var theItems = component.get("v.items");
            helper.createItem(component, newItemRef);
        }
        
	}
})