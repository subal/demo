public class OauthBusinessServices{
    public OauthBusinessServices() {

    }


String clienId='872354678784234';
String clientSecret = '24589145335666344bea45356wsfg345';
String cred = 'credentials';
public String access_token {get;set;}
public String CIResp {get;set;}

public OauthBusinessServices(ApexPages.StandardController controller){
}
  
  public void getOauthToken(){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://randy:ydnar@92.43.127.56/oauth/access_token?client_id='+clienId+'&client_secret='+clientSecret+'&grant_type='+cred+''); 
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        access_token = res.getBody();
        system.debug('s......'+access_token);                
        }
 public void callBussinessService(){
       Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://213.174.69.111:7890/YSSCProductList');
        req.setHeader('access_token',access_token);
        req.setBody('{"inputArray":[{"amsId":195728,"instSeq":110608},{"amsId":195728,"instSeq":110608}]}'); 
        req.setMethod('POST');
        HttpResponse res = http.send(req);
        CIResp = res.getBody();
        system.debug('CIResp: '+CIResp);
 }       
}