import 'quest.dart';

class Quiz{
  int questionNumber=0;
  int total =0;

  // making it private by _ underscore before variable.....
  //to encapsulate
  List<quest> _questions =[
    quest('Some cats are actually allergic to humans', true),
    quest('You can lead a cow down stairs but not up stairs.', false),
    quest('Approximately one quarter of human bones are in the feet.', true),
    quest('A slug\'s blood is green.', true),
    quest('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    quest('It is illegal to pee in the Ocean in Portugal.', true),
    quest(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    quest(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    quest(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    quest(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    quest('Google was originally called \"Backrub\".', true),
    quest(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    quest(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];


  void nextQuestion(){
    if(questionNumber < _questions.length-1){
         questionNumber++;
    }
  }

String getQuestion(){
  return _questions[questionNumber].question;
}

bool getAns(){
  return _questions[questionNumber].ans;
}

// is  questions finished or not ...
bool isFinish(){
    if(questionNumber == _questions.length-1){
      return true;

    }else{
      return false;
    }
}

void reset(){
    questionNumber =  0;
}

void result(){
    if(getAns() == true){
           total++;
    }
}



}