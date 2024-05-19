access(all) contract SomeContract {
    pub var testStruct: SomeStruct

    pub struct SomeStruct {

        //
        // 4 Variables
        //

        pub(set) var a: String

        pub var b: String

        access(contract) var c: String

        access(self) var d: String

        //
        // 3 Functions
        //

        pub fun publicFunc() {}

        access(contract) fun contractFunc() {}

        access(self) fun privateFunc() {}


        pub fun structFunc() {
            /**************/
            /*** AREA 1 ***/
            /**************/

            //Read-access
            var at1 = self.a
            var bt1 = self.b
            var ct1 = self.c
            var dt1 = self.d
            self.publicFunc()
            self.contractFunc()
            self.privateFunc()

            //Write-access
            self.a = "an1"
            self.b = "bn1"
            self.c = "cn1"
            self.d = "dn1"

        }

        init() {
            self.a = "a"
            self.b = "b"
            self.c = "c"
            self.d = "d"
        }
    }

    pub resource SomeResource {
        pub var e: Int

        pub fun resourceFunc() {
            /**************/
            /*** AREA 2 ***/
            /**************/

            var structObj2: SomeStruct = SomeStruct()

            //Read-access
            var at2 = structObj2.a
            var bt2 = structObj2.b
            var ct2 = structObj2.c
            var dt2 = structObj2.d //Error: cannot access `d`: field has private access
            structObj2.publicFunc()
            structObj2.contractFunc()
            structObj2.privateFunc() //Error: cannot access `privateFunc`: function has private access

            //Write-access
            structObj2.a = "an2"
            structObj2.b = "bn2" //Error: cannot assign to `b`: field has public access. consider making it publicly settable with `pub(set)`
            structObj2.c = "cn2" //Error: cannot assign to `c`: field has contract access. consider making it publicly settable with `pub(set)`
            structObj2.d = "dn2" //Error: cannot access `d`: field has private access

        }

        init() {
            self.e = 17
        }
    }

    pub fun createSomeResource(): @SomeResource {
        return <- create SomeResource()
    }

    pub fun questsAreFun() {
        /**************/
        /*** AREA 3 ****/
        /**************/

        var structObj3: SomeStruct = SomeStruct()

        //Read-access
        var at2 = structObj3.a
        var bt2 = structObj3.b
        var ct2 = structObj3.c
        var dt2 = structObj3.d //Error: cannot access `d`: field has private access
        structObj3.publicFunc()
        structObj3.contractFunc()
        structObj3.privateFunc() //Error: cannot access `privateFunc`: function has private access

        //Write-access
        structObj3.a = "an3"
        structObj3.b = "bn3" //Error: cannot assign to `b`: field has public access. consider making it publicly settable with `pub(set)`
        structObj3.c = "cn3" //Error: cannot assign to `c`: field has contract access. consider making it publicly settable with `pub(set)`
        structObj3.d = "dn3" //Error: cannot access `d`: field has private access
    }

    init() {
        self.testStruct = SomeStruct()
    }
}
