@isTest
global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
               ParkService.byCountryResponse resp =new ParkService.byCountryResponse();
                   // start - specify the response you want to send
               List<String> te = new List<String>();
               te.add('Test Park 1');
               te.add('Test Park 2');
        //response_x.return_x = te;
        resp.return_x =te;
        // end
        response.put('response_x', resp); 
   }
}