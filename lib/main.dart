import 'package:flutter/material.dart';
import 'package:animated_splash/animated_splash.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplash(
        home: Home(),
        imagePath: 'img/spotify.png',
        duration: 2500,
        type:AnimatedSplashType.StaticDuration,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Color> colors = [Color(0xFFFB9245),Color(0xFFF54E6B)];
  int _index = 0;
  bool _rememberMe = false;
  Widget TermsCondition() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.grey),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'I agree to the terms and conditions.',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          top: false,
          bottom: false,
          left: false,
          right: false,

          child:
          Container(
            decoration: BoxDecoration(gradient: LinearGradient(colors: colors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),

            child: Center(
              child: SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                  Text("App Name",style: TextStyle(fontSize: 30,color: Colors.white),),
                  Tabs(context),
                  AnimatedCrossFade(

                    duration: Duration(milliseconds: 100),
                    firstChild: Login(context),
                    secondChild: SignUp(context),
                    crossFadeState: _index == 0 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  )

                ],),
              ),
            ),
          ),
        )
    );
  }

  Widget Login(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:30.0,left: 15,right: 15),
      child: Column(
        children: <Widget>[
          Stack(
              overflow: Overflow.visible,
              alignment: Alignment.bottomCenter,
              children:<Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top:10.0,left: 15,right: 15,bottom: 20),
                    child: Column(children: <Widget>[

                      TextField(decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email,color: Colors.grey,),
                          labelText: "Enter Your Email",
                          labelStyle: TextStyle(color: Colors.black87),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))

                      ),),

                      Divider(color: Colors.grey,height: 8),

                      TextField(decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.black87),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))

                      ),),
                    ],),
                  ),),
              ]
          ),
          SizedBox(height: 30,),
          GestureDetector(
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              decoration: BoxDecoration(gradient: LinearGradient(colors: colors,),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:12.0),
                child: Center(child: Text("LOGIN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:45.0),
            child: GestureDetector(
              child: Center(child: Text("Forget Password?",style: TextStyle(color: Colors.white,fontSize: 16),)),

              onTap: (){},
            ),
          ),





        ],
      ),
    );
  }


  Widget SignUp(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:30.0,left: 15,right: 15),
      child: Column(
        children: <Widget>[
          Stack(
              overflow: Overflow.visible,
              alignment: Alignment.bottomCenter,
              children:<Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top:10.0,left: 15,right: 15,bottom: 20),
                    child: Column(children: <Widget>[

                      TextField(decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email,color: Colors.grey,),
                          labelText: "Enter Your Email/Phone Number",
                          labelStyle: TextStyle(color: Colors.black87),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))

                      ),),
                      Divider(color: Colors.grey,height: 8),
                      TextField(decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone,color: Colors.grey,),
                        labelText: "Verification Code",
                        labelStyle: TextStyle(color: Colors.black87),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      ),),
                      Divider(color: Colors.grey,height: 8),
                      TextField(decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle_rounded,color: Colors.grey,),
                        labelText: "Username",
                        labelStyle: TextStyle(color: Colors.black87),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      ),),
                      Divider(color: Colors.grey,height: 8),
                      TextField(decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black87),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      ),),
                      Divider(color: Colors.grey,height: 8),
                      TextField(decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(color: Colors.black87),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      ),),
                      Divider(color: Colors.transparent,height: 8),
                      TermsCondition(),


                    ],),
                  ),
                ),
              ]
          ),
          SizedBox(height: 20,),
          GestureDetector(
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              decoration: BoxDecoration(gradient: LinearGradient(colors: colors,),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:12.0),
                child: Center(child: Text("SIGNUP",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Tabs(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:30.0,left: 15,right: 15),
      child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.12),
            borderRadius: BorderRadius.circular(25),
          ),
          child:
          Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[

            Expanded(
              child: GestureDetector(
                child: Container(
                    decoration: BoxDecoration(color: _index == 0 ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Existing",style: TextStyle(color: _index == 0 ? Colors.black : Colors.white,fontSize: 18,fontWeight: _index == 0 ? FontWeight.bold : FontWeight.normal),),
                    ))
                ),
                onTap: (){

                  setState(() {
                    _index = 0;
                  });
                },
              ),
            ),

            Expanded(
              child: GestureDetector(
                child: Container(
                    decoration: BoxDecoration(color: _index == 1 ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("New",style: TextStyle(color: _index == 1 ? Colors.black : Colors.white,fontSize: 18,fontWeight:  _index == 1 ? FontWeight.bold : FontWeight.normal),),
                    ))),

                onTap: (){

                  setState(() {
                    _index = 1;
                  });
                },
              ),
            )
          ],)
      ),
    );
  }
}