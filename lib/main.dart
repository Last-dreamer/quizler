import 'package:flutter/material.dart';
import 'cheker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
void main() => runApp(MyApp());

Quiz quiz = new Quiz();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> mIcon = [];

void alert(BuildContext context){
  Alert(context: context,
      title: "FilledStacks",
      desc: "Flutter is awesome.")
      .show();
}

  // checking the answer...
  void checkAns(bool userPickAns,BuildContext context){
    bool questAns = quiz.getAns();
     setState(() {
       if (quiz.isFinish()==true) {
         //TODO: fixing the bugs...... not showing an alert.....
         alert(context);
         quiz.reset();
         mIcon =[];
       } else {
         if (userPickAns == questAns) {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: Padding(
            padding:EdgeInsets.symmetric(horizontal: 8.0),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: <Widget>[
                Expanded(
                  flex:5,
                  child:Padding(
                      padding: EdgeInsets.all(10.0),
                      child:Center(
                        child:Text(
                          // getting questions from quiz class
                            quiz.getQuestion(),
                            style:TextStyle(fontSize:40.0,
                              color:Colors.white,
                            fontFamily:'Pacifico Regular')
                        ),)

                  ),
                ),
                //true button
                Expanded(
                  child:Padding(
                    padding:EdgeInsets.all(15.0),
                    child: RaisedButton(
                      color:Colors.green,
                      onPressed: () {
                        checkAns(true,context);



                      },
                      child: Text("True",style:TextStyle(fontSize:25.0,
                          color:Colors.white,
                      fontFamily: 'Pacifico Regular')),
                    ),
                  ),
                ),
                Expanded(
                  child:Padding(
                    padding:EdgeInsets.all(15.0),
                    child: RaisedButton(
                      color:Colors.red,
                      child:Text("False",style:TextStyle(fontSize:25.0,color:Colors.white,
                          fontFamily: 'Pacifico Regular')),
                      onPressed: () {
                         checkAns(false,context);
                               },

                    ),
                  ),
                ),

                Row(
                  children: mIcon,
                ),
              ],
            ),
          ),
           ),
    );
  }
}
