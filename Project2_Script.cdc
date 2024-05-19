import SomeContract from 0x08

pub fun main() {
  /**************/
  /*** AREA 4 ***/
  /**************/

  var structObj4 = SomeContract.SomeStruct()

  //Read-access
  var at2 = structObj4.a
  var bt2 = structObj4.b
  var ct2 = structObj4.c //Error: cannot access `c`: field has contract access
  var dt2 = structObj4.d //Error: cannot access `d`: field has private access
  structObj4.publicFunc()
  structObj4.contractFunc() //Error: cannot access `contractFunc`: function has contract access
  structObj4.privateFunc() //Error: cannot access `privateFunc`: function has private access

  //Write-access
  structObj4.a = "an4"
  structObj4.b = "bn4" //Error: cannot assign to `b`: field has public access. consider making it publicly settable with `pub(set)`
  structObj4.c = "cn4" //Error: cannot assign to `c`: field has contract access. consider making it publicly settable with `pub(set)`
  structObj4.d = "dn4" //Error: cannot access `d`: field has private access
}
