({
    
    doInit : function(component, event) {
        var action = component.get("c.getJobDetails");
        action.setCallback(this, function(a) {
            component.set("v.jobs", a.getReturnValue());
        });
        $A.enqueueAction(action);
    },  
    
handleShowModal: function(component, evt, helper) {
        var modalBody;
        var recId= component.get('v.recordId');
    console.log('hi' +recId);
        $A.createComponent("c:JobModal", {recordId:recId},
           function(content, status) {
               if (status === "SUCCESS") {
                   modalBody = content;
                   component.find('overlayLib').showCustomModal({
                       header: "Application Details",
                       body: modalBody, 
                       showCloseButton: true,
                      
                   })
               }                               
           });
    } 
})