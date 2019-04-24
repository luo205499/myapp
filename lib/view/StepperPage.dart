import 'package:flutter/material.dart';
import 'package:myapp/model/Post.dart';

class StepperPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StepperPage();
  }
}

class _StepperPage extends State<StepperPage> {
  var _currentStep=0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Theme(data: Theme.of(context).copyWith(
              primaryColor: Colors.black,
            ), child: new Stepper(
              currentStep: _currentStep,
              onStepTapped: (int value){
                setState(() {
                  _currentStep=value;
                });
              },
              onStepContinue: (){
                setState(() {
                  _currentStep<2?_currentStep+=1:_currentStep=0;
                });
              },
              onStepCancel: (){
                setState(() {
                  _currentStep>0?_currentStep-=1:_currentStep=0;
                });
              },
              steps: [
              Step(
                  title: Text("Login"),
                  subtitle: Text("Login first"),
                  content: Text("The plugin adds a random text generator, capable of creating witty texts in different genres."
                      " Created text can be inserted newly at the caret, or replace a selection"),
                isActive: _currentStep==0,
              ),
              Step(
                title: Text("Chonse Plan"),
                subtitle: Text("Login first"),
                content: Text("The plugin adds a random text generator, capable of creating witty texts in different genres."),
                isActive: _currentStep==1,
              ),
              Step(
                title: Text("Comfim Payment"),
                subtitle: Text("Login first"),
                content: Text(" Created text can be inserted newly at the caret, or replace a selection"),
                isActive: _currentStep==2,
              ),
            ],),),
          ],
        ),
      ),
    );
  }
}
