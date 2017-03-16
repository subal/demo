public class CsvUpload1 {
    public Static void Func(){
String s = '[{"Revenue": "$1,000,000","Employees": "12345","MarketCap": "$1,000,000","Website": "www.yahoo.com","WebsiteURL": "http://www.yahoo.com","Industry": "Information Technology","LongDescription": "Long text","Description": "Discripting here","NodeID": "Org|345222","DisplayName": "Yahoo News"},{"Revenue": "$2,000,000","Employees": "345435","MarketCap": "$1,02300,000","Website": "www.google.com","WebsiteURL": "http://www.google.com","Industry": "Information Technology","LongDescription": "Long text","Description": "Discripting here","NodeID": "Org|5323232","DisplayName": "Google Search"},{"Revenue": "$5000,000,000","Employees": "500000","MarketCap": "$2,000,0000000","Website": "www.apple.com","WebsiteURL": "http://www.apple.com","Industry": "Telecommunication","LongDescription": "Long text","Description": "Discripting here","NodeID": "Org|534534","DisplayName": "Apple News"}]';
List<Object> entryList = (List<Object>)JSON.deserializeUntyped(s);
List<Map<String, Object>> mapList = new List<Map<String, Object>>();
Set<String> keySet = new Set<String>();
   
    {for(Object entry : entryList){
    Map<String, Object> m = (Map<String, Object>)(entry);
    keySet.addAll(m.keySet());
    mapList.add(m);
    }}
List<String> keys = new List<String>(keySet);
        {keys.sort();}
List<List<String>> csvLines = new List<List<String>>();
    {for(Integer i = 0; i <= mapList.size();i++){
    csvLines.add(new List<String>());
    }}
    {for (String key : keys) {
    csvLines.get(0).add('"' + key + '"');
    
        for (Integer i = 1; i <= mapList.size(); i++) {
        csvLines.get(i).add('"' + (String)(mapList.get(i - 1).get(key)) + '"');
        }
    }}
String csvFile = '';
    {for(List<String> csvLine : csvLines){
    String line = '';
        for (Integer i = 0; i < csvLine.size() - 1; i++){
            line += csvLine.get(i) + ',';
        }
        line += csvLine.get(csvLine.size() - 1);
        csvFile += line + '\n';
    }}
    {System.debug(csvFile);}
      String Date1 = Datetime.now().formatGMT('EEE,   dd MMM yyyy HH:mm:ss z');
       //String Date1 = Datetime.now().formatGMT('MM/dd/yyyy HH:mm:ss z');
        System.debug('Date: ' + Date1);
        String region = 's3-eu-west-1';
        String bucketname = 'sofus-preprod';
        String awsService = 's3';
        String method = 'PUT';
        String filename = 'test23';
        String foldername ='caseflowmaster';
        String secret='Z5h62ODKFzITWHEjU4r6sKF0FS/IgVWPhAV5cJNI';
        String key='AKIAJLJR2LEINRG25ANQ';
        HttpRequest req = new HttpRequest();
        req.setMethod(method);
        req.setHeader('Host',bucketname+'.s3.amazonaws.com');
        System.debug('Host: ' + req.getHeader('Host'));
        
       // req.setHeader('Host','s3-website-us-west-2.amazonaws.com');
       // req.setEndpoint('https://s3-us-west-2.amazonaws.com');
        req.setEndpoint('https://'+bucketname+'.s3.amazonaws.com' + '/'+ foldername + '/' + filename);

        req.setHeader('Content-Length', string.valueOf(csvFile.length()));
        req.setHeader('Content-Encoding', 'UTF-8');
        //req.setHeader('Content-Type', 'text/plain');
        req.setHeader('Date', Date1);
        //req.setHeader('x-amz-date', Date1);
        
        //get signature string
       // String stringToSign = 'PUT\n\n'+ 'multipart/form-data' + '\n' + Date1+'\n/'+bucketname;
        //Blob mac = Crypto.generateMac('HMacSHA1', blob.valueof(stringToSign),blob.valueof(secret));
        //
        //String str = Base64( HMAC-SHA1( key, UTF-8-Encoding-Of( StringToSign ) ) );
        
        //String sig = EncodingUtil.base64Encode(mac);
        String canonicalBuffer='PUT\n\n'+'application/json\n'+Date1+'\n/'+bucketname+'/'+ foldername +'/'+filename;
        
        Blob mac = Crypto.generateMac('HMACSHA1', blob.valueof(canonicalBuffer),blob.valueof(secret));
        String sig = EncodingUtil.base64Encode(mac);
        
        //String signature = make_sig(secret, stringToSign);
        //Blob headerValue =Blob.valueOf(key+':'+sig);
        //System.debug('headerValue: ' + headerValue);
       // req.setHeader('Signature', sig);
        System.debug('signature: ' + sig);
        //String authHeader1 = 'AWS ' +EncodingUtil.base64Encode(headerValue) ;
        String authHeader = 'AWS ' + key + ':' + sig;
        System.debug('authHeader: ' + authHeader);
        //System.debug('authHeader1: ' + authHeader1);
        req.setHeader('Authorization',authHeader);
        req.setHeader('Content-type', 'application/json');       
        req.setHeader('Connection','keep-alive');
        req.setHeader('ACL','public-read');

        req.setBodyAsBlob(blob.valueOf(csvFile));
        System.debug('Final Req:' + req);
        Http http = new Http();

        try {
            //Execute web service call
            HTTPResponse res = http.send(req);
            System.debug('RESPONSE STRING: ' + res);
            System.debug('RESPONSE STATUS: '+res.getStatus());
            System.debug('STATUS_CODE: '+res.getStatusCode());
            System.debug('Authori:'+res.getHeader('Authorization'));

        } catch(Exception e) {
            system.debug('AWS Service Callout Exception: ' + e.getMessage());
        }

}
}