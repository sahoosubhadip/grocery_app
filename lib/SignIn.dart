import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/SignUp.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0XFF029EB9),
      backgroundColor: Color(0xFFFFC400),
      body: _index == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _index == 2
              ? Center(
                  child: Text('No Internet'),
                )
              : SingleChildScrollView(
                  // padding: EdgeInsets.only( top:15,bottom: 0,left: 10, right: 10),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 14, bottom: 10, left: 10, right: 10),
                    child: Card(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            bottomLeft: Radius.circular(18),
                            bottomRight: Radius.circular(18),
                            topRight: Radius.circular(18)),
                      ),
                      child: Column(
                        children: <Widget>[
                          pic(),
                          login(),
                          SizedBox(
                            height: 10,
                          ),
                          newAccountText(),
                          SizedBox(
                            height: 5,
                          ),
                          signUP(context),
                          SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }

  pic() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        height: 340,
        width: 400,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
                fit: BoxFit.contain, image: AssetImage('assets/entry.png'))),
      ),
    );
  }

  login() {
    return Container(
      padding: EdgeInsets.only(top: 0, left: 10, right: 10),
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18),
              topRight: Radius.circular(18)),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 18, right: 18, top: 20, bottom: 15),
          child: Column(
            children: <Widget>[
              Text(
                "Sign in",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Color(0XFF029EB9)),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                  labelText: ' Username',
                  hintText: 'user@email.com',
                  suffixIcon: Icon(
                    Icons.visibility,
                    color:Color(0xFFFFC400),
                  ),
                  prefixIcon: Icon(
                    Icons.perm_identity,
                    color:Color(0xFFFFC400),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                style: TextStyle(
                  color: Color(0XFF029EB9),
                ),
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  labelText: 'Password',
                  hintText: '********',
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color:Color(0xFFFFC400),
                  ),
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color:Color(0xFFFFC400),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 155),
                child: InkWell(
                  child: Text(
                    "Forgot password ?",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black45,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                  onTap: () {},
                ),
              ),
              if (_index == 2) Text('No Internet Connection'),
              SizedBox(
                height: 18.0,
              ),
              Material(
                borderRadius: BorderRadius.circular(20.0),
                //shadowColor:   Colors.yellow,
                color: Color(0xFFFFC400),
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    // onTap: onLogin,
                    child: Center(
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    onTap: () {
                      print("called");
                      Connectivity()
                          .onConnectivityChanged
                          .listen((ConnectivityResult result) {
                        setState(() {
                          _index = result.index;
                        });
                        print(
                            "Connectivity Status: " + result.index.toString());
                      });

                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => HomeScreen()),
                      // );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

newAccountText() {
  {
    return Text(
      "Don't have an account ?",
      style: TextStyle(
          color: Colors.black45, fontSize: 15, fontWeight: FontWeight.normal),
    );
  }
}

signUP(context) {
  return InkWell(
    child: Text(
      "Sign up",
      style: TextStyle(
          decoration: TextDecoration.underline,
          color: Color(0xFFFFC400),
          fontSize: 16,
          fontWeight: FontWeight.w700),
    ),
    onTap: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUp()),
      );
    },
  );
}
