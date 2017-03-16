({
	packItem  : function(component, event, helper) {
		var btnClicked = event.getSource();
        var a = component.get("v.item",true);
        a.Packed__c = true;
        component.set("v.item",a);
        //component.set("v.item.Packed__c","Packed");
        btnClicked.set("v.disabled",true);
	}
})