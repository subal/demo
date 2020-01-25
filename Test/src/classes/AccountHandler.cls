public class AccountHandler{

//add 1234

public static Account insertNewAccount(String name){
Account acc = new Account();
acc.Name = name;

try{
insert acc;

}catch (DmlException e) {
    System.debug('A DML exception has occurred: ' +e.getMessage());
    return null;
}

System.debug(acc);
return acc;

}

}
