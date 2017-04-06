public class TestSoap {
    
    public class Result {
        public String code { get; set; }
        public String message { get; set; }
    }
    
    public static Result CheckPaymentTransaction() {
        
        Result result = new Result();
        String CallandPayServer= 'https://wp-ws.prosodie.com';
        
        Http h = new Http();
        HttpResponse res = new HttpResponse();
        HttpRequest req = new HttpRequest();       
        
        req.setEndpoint(CallandPayServer+'/services/v1/AccountOnlineProcessing?op=CheckPaymentTransaction');        
        req.setHeader('Content-Type','text/xml');
        //req.setHeader('SOAPAction','CheckPaymentTransaction');
        
        String content = '';
       /*  content =  'HeaderElement='+EncodingUtil.urlEncode('HeaderElement', 'UTF-8') +
         '&HeaderElement:fastAccess:accessId='+EncodingUtil.urlEncode('DEMO-FSO-TEST', 'UTF-8') +
         '&HeaderElement:fastAccess:accessToken='+EncodingUtil.urlEncode('4514f3cc13541c636f881d9c1e8ac1261a6f02f2c6ed66b75913d98c637a5d3742f155d2ee7fddcb4d8e7d7b166cf4fea90c507af69842e74e0fc234d4bf6fb6', 'UTF-8') +
         'CheckPaymentTransactionRequestElement='+EncodingUtil.urlEncode('CheckPaymentTransactionRequestElement', 'UTF-8') +
         'CheckPaymentTransactionRequestElement:transactionIdentification:merchantTransactionId='+EncodingUtil.urlEncode('fso100bc071a0a13011467869187742', 'UTF-8');
       */ 
       content = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:acc="http://wp-ws.prosodie.com/services/v1/AccountOnlineProcessing/" xmlns:glob="http://wp-ws.prosodie.com/services/v1/common/GlobalTypes/">'+
                   '<soapenv:Header><acc:HeaderElement><glob:fastAccess><glob:accessId>DEMO-FSO-TEST</glob:accessId>'+
                    '<glob:accessToken>4514f3cc13541c636f881d9c1e8ac1261a6f02f2c6ed66b75913d98c637a5d3742f155d2ee7fddcb4d8e7d7b166cf4fea90c507af69842e74e0fc234d4bf6fb6</glob:accessToken>'+
                     '</glob:fastAccess></acc:HeaderElement></soapenv:Header><soapenv:Body>'+
                     '<acc:CheckPaymentTransactionRequestElement><acc:transactionIdentification>'+
                      '<acc:merchantTransactionId>fso100bc0a2f054a011467881244542</acc:merchantTransactionId>'+
                      '</acc:transactionIdentification></acc:CheckPaymentTransactionRequestElement></soapenv:Body></soapenv:Envelope>'; 
        req.setHeader('Content-Length',''+content.length());
        req.setBody(content); 
        req.setMethod('POST');
       // req.setCompressed(true);
        
        res =  h.send(req);
        
        //check body and parse
        System.debug('VFC07OdigoCallandPay - Http Response: '+res.getBody());
        
        return result;               //todo map body with resuly
    }


}