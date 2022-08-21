import 'package:calculator_app/Constants/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var userinput;
  var result;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff22252D),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(userinput.toString(),style: const TextStyle(color: Colors.white,fontSize: 25,),),
                        const SizedBox(height: 10,),
                        Text(result.toString(),style: const TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
                        const SizedBox(height: 50,),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff2A2D37),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))

                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                                children: [
                                  MyButton(title: "AC",titleColor:const Color(0xff53D3C1),onPress: (){
                                    setState(() {
                                      userinput = '';
                                      result = '';
                                    });
                                  },),
                                  MyButton(title: "+/-",titleColor:const Color(0xff53D3C1),onPress: (){
                                    setState(() {
                                      userinput += '+/-';
                                    });
                                  },),
                                  MyButton(title: "%",titleColor:const Color(0xff53D3C1),onPress: (){
                                    setState(() {
                                      userinput += '%';
                                    });
                                  },),
                                  MyButton(title: "/",titleColor:const Color(0xffE77878),onPress: (){
                                    setState(() {
                                      userinput += '/';
                                    });
                                  },),
                                ]
                            ),
                            Row(
                                children: [
                                  MyButton(title: "7",onPress: (){
                                    setState(() {
                                      userinput += '7';
                                    });
                                  },),
                                  MyButton(title: "8",onPress: (){
                                    setState(() {
                                      userinput += '8';
                                    });
                                  },),
                                  MyButton(title: "9",onPress: (){
                                    setState(() {
                                      userinput += '9';
                                    });
                                  },),
                                  MyButton(title: "x",titleColor:const Color(0xffE77878),onPress: (){
                                    setState(() {
                                      userinput += 'x';
                                    });
                                  }),
                                ]
                            ),
                            Row(
                                children: [
                                  MyButton(title: "4",onPress: (){
                                    setState(() {
                                      userinput += '4';
                                    });
                                  },),
                                  MyButton(title: "5",onPress: (){
                                    setState(() {
                                      userinput += '5';
                                    });
                                  },),
                                  MyButton(title: "6",onPress: (){
                                    setState(() {
                                      userinput += '6';
                                    });
                                  },),
                                  MyButton(title: "-",titleColor:const Color(0xffE77878),onPress: (){
                                    setState(() {
                                      userinput += '-';
                                    });
                                  },),
                                ]
                            ),
                            Row(
                                children: [
                                  MyButton(title: "1",onPress: (){
                                    setState(() {
                                      userinput += '1';
                                    });
                                  },),
                                  MyButton(title: "2",onPress: (){
                                    setState(() {
                                      userinput += '2';
                                    });
                                  },),
                                  MyButton(title: "3",onPress: (){
                                    setState(() {
                                      userinput += '3';
                                    });
                                  },),
                                  MyButton(title: "+",titleColor:const Color(0xffE77878),onPress: (){
                                    setState(() {
                                      userinput += '+';
                                    });
                                  },),
                                ]
                            ),
                            Row(
                                children: [
                                  MyButton(title: "0",onPress: (){
                                    setState(() {
                                      userinput += '0';
                                    });
                                  },),
                                  MyButton(title: ".",onPress: (){
                                    setState(() {
                                      userinput += '.';
                                    });
                                  },),
                                  MyButton(title: "DEL",onPress: (){
                                    userinput = userinput.substring(0,userinput.length-1);
                                    setState(() {

                                    });
                                  },),
                                  MyButton(title: "=",titleColor:const Color(0xffE77878),onPress: (){
                                    setState(() {
                                      equalPress();
                                    });
                                  },),
                                ]
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }

  void equalPress(){
    String finalInput = userinput;
    finalInput = userinput.replaceAll('x','*');
    Parser p = Parser();
    Expression expression = p.parse(finalInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);

    result = eval;
  }
}
