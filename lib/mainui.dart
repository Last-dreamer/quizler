import 'dart:io';

import 'package:flutter/material.dart';
import 'cheker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quiz quiz = new Quiz();
// score counter
 int total=0;
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> mIcon = [];

  void alert(BuildContext context) {

    var alertStyle = AlertStyle(
      animationType: AnimationType.fromLeft,
      animationDuration:Duration(milliseconds:0550),
      titleStyle: TextStyle(color:Colors.red),
    );
    Alert(context: context,
        title: "Quiz Finished",
        desc: "your Score is .$total\n " ,
        style:alertStyle,
    buttons:[
      DialogButton(
        child:Text("Try Again",style:TextStyle(color:Colors.red,
            fontSize:20.0)
        ),
        onPressed: (){
             Navigator.pop(context);

        },
      ),
      DialogButton(
        child:Text("Exit",style:TextStyle(color:Colors.red,
          fontSize:20.0)
        ),
        onPressed: (){
             exit(0);
             //TODo : fixing bugs.......
            //SystemNavigator.pop().
        },
      ),

    ])
        .show();
  }

  // checking the answer...
  void checkAns(bool userPickAns, BuildContext context) {
    bool questAns = quiz.getAns();
    setState(() {
      if (quiz.isFinish() == true) {
        alert(context);
        quiz.reset();
        mIcon = [];
        total=0;
      } else {
        if (userPickAns == questAns) {
          total++;
          mIcon.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          mIcon.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quiz.nextQuestion();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      // getting questions from quiz class
                        quiz.getQuestion(),
                        style: TextStyle(fontSize: 40.0,
                            color: Colors.white,
                            fontFamily: 'Pacifico Regular')
                    ),)

              ),
            ),
            //true button
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    checkAns(true,context);


                  },
                  child: Text("True", style: TextStyle(fontSize: 25.0,
                      color: Colors.white,
                      fontFamily: 'Pacifico Regular')),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: RaisedButton(
                  color: Colors.red,
                  child: Text("False",
                      style: TextStyle(fontSize: 25.0, color: Colors.white,
                          fontFamily: 'Pacifico Regular')),
                  onPressed: () {
                    checkAns(false, context);
                  },

                ),
              ),
            ),

            Row(
              children: mIcon,
            ),
          ],
        ),
      );
  }
}