import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';


class MPinPage extends StatefulWidget {
  @override
  _MPinPageState createState() => _MPinPageState();
}
String output = '';
class _MPinPageState extends State<MPinPage> {


  _appendToOutput(value) {
    if (this.mounted) {
      this.setState((){
        output = output == '' ? value.toString() : output + value.toString();
      });
    }
  }
  _removeFromOutput() {
    if (this.mounted) {
      this.setState(() {
        output = output.substring(0, output.length-1);
      });
    }
  }
  backButton() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              _removeFromOutput();
            },
            color: Color(0xff63E2E0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
              child: new Icon(Icons.backspace,color: Color(0xff373D3F),),
            ),
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)),
          ),
        ]
    );
  }
  numericInputButton(value) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              _appendToOutput(value);
              print(output);
            },
            color: Color(0xff63E2E0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value.toString(),
                style: TextStyle(fontSize: 25, color: Color(0xff373D3F)),
              ),
            ),
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)),
          ),
        ]
    );
  }
  bool pinValidity = true;
  void checkPin(){
    //Function to check Pin
    setState(() {
      pinValidity = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    Text warningBuilder(){
      if(!pinValidity){
        return Text('Invalid mPin! Please Retry',
          style: TextStyle(color: Colors.redAccent));
      }
      else{
      return Text('');
      }
    }
    Row spaceBuilder(){
      if(output.length==0){
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('__',
              style: TextStyle(fontSize: 25, color: Color(0xff63E2E0)),),
            Text('__',
              style: TextStyle(fontSize: 25, color: Color(0xff373D3F)),),
            Text('__',
              style: TextStyle(fontSize: 25, color: Color(0xff373D3F)),),
            Text('__',
              style: TextStyle(fontSize: 25, color: Color(0xff373D3F)),)
          ],
        );
      }
      else if(output.length==1){
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('*',
              style: TextStyle(fontSize: 25, color: Color(0xff373D3F)),),
            Text('__',
              style: TextStyle(fontSize: 25, color: Color(0xff63E2E0)),),
            Text('__',
              style: TextStyle(fontSize: 25, color: Color(0xff373D3F)),),
            Text('__',
              style: TextStyle(fontSize: 25, color: Color(0xff373D3F)),)
          ],
        );
      }
      else if(output.length==2){
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('*',
              style: TextStyle(fontSize: 25, color: Color(0xff373D3F)),),
            Text('*',
              style: TextStyle(fontSize: 25, color: Color(0xff373D3F)),),
            Text('__',
              style: TextStyle(fontSize: 25, color: Color(0xff63E2E0)),),
            Text('__',
              style: TextStyle(fontSize: 25, color: Color(0xff373D3F)),)
          ],
        );
      }
      else if(output.length==3){
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('*',
              style: TextStyle(fontSize: 25, color: Color(0xff373D3F)),),
            Text('*',
              style: TextStyle(fontSize: 25, color: Color(0xff373D3F)),),
            Text('*',
              style: TextStyle(fontSize: 25, color: Color(0xff373D3F)),),
            Text('__',
              style: TextStyle(fontSize: 25, color: Color(0xff63E2E0)),)
          ],
        );
      }
      else if(output.length==4){
        checkPin();
        output = '';
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('*',
              style: TextStyle(fontSize: 25, color: Color(0xff373D3F)),),
            Text('*',
              style: TextStyle(fontSize: 25, color: Color(0xff373D3F)),),
            Text('*',
              style: TextStyle(fontSize: 25, color: Color(0xff373D3F)),),
            Text('*',
              style: TextStyle(fontSize: 25, color: Color(0xff373D3F)),)
          ],
        );
      }

    }
    double tileHeight = MediaQuery.of(context).size.height;
    double tileWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  spaceBuilder(),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: warningBuilder(),
                  ),

                  SizedBox(height: 50,),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row (
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              numericInputButton(1),
                              numericInputButton(2),
                              numericInputButton(3),
                            ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row (
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              numericInputButton(4),
                              numericInputButton(5),
                              numericInputButton(6),
                            ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row (
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            numericInputButton(7),
                            numericInputButton(8),
                            numericInputButton(9),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row (
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              numericInputButton(0),
                              backButton()
                            ]
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: Text(
                          'Forgot Pin',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff63E2E0),
                              fontSize: tileWidth * 0.06),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}