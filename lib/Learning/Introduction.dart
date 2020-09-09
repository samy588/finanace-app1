import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Introduction extends StatefulWidget {
  String currentUserID;
  String moduleno; //if you have multiple values add here
  Introduction(this.moduleno, {Key key,@required this.currentUserID}) : super(key: key);
  @override
  _IntroductionState createState() => _IntroductionState(currentUserID: currentUserID);
}

class _IntroductionState extends State<Introduction> {
  String currentUserID;
  _IntroductionState({@required this.currentUserID});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xff373D3F),
        ),
        backgroundColor: Color(0xff63E2E0),
        centerTitle: true,
        title: Column(
          children: <Widget>[
            Text(
              'Module ${widget.moduleno}',
              style: TextStyle(color: Color(0xff373D3F)),
            ),
            Text(
              'Stock Market Basics',
              style: TextStyle(
                  color: Color(0xff373D3F), fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    color: Color(0xff63E2E0),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "What will you learn?",
                            style: TextStyle(
                                color: Color(0xff373D3F),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            "This module will help you to understand the basics of marketing including IPO markets, commonly used jargons, trading terminal, and market events.",
                            style: TextStyle(
                                color: Color(0xff373D3F), fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ExpansionTile(
                      title: Row(
                        children: <Widget>[
                          Icon(
                            Icons.lens,
                            color: Color(0xff63E2E0),
                            size: 16,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Beginner"),
                        ],
                      ),
                      children: <Widget>[
                        Text("Progress: 0.0 %"),
                        SizedBox(
                          height: 20,
                        ),
                        LinearPercentIndicator(
                          lineHeight: 10.0,
                          percent: 0.0,
                          backgroundColor: Color(0xffC8E6C9),
                          progressColor: Color(0xff2BD26E),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ExpansionTile(
                      title: Row(
                        children: <Widget>[
                          Icon(
                            Icons.lens,
                            color: Color(0xff63E2E0),
                            size: 16,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Intermediate"),
                        ],
                      ),
                      children: <Widget>[
                        Text("Progress: 0.0 %"),
                        SizedBox(
                          height: 20,
                        ),
                        LinearPercentIndicator(
                          lineHeight: 10.0,
                          percent: 0.0,
                          backgroundColor: Color(0xffC8E6C9),
                          progressColor: Color(0xff2BD26E),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ExpansionTile(
                      title: Row(
                        children: <Widget>[
                          Icon(
                            Icons.lens,
                            color: Color(0xff63E2E0),
                            size: 16,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Advanced"),
                        ],
                      ),
                      children: <Widget>[
                        Text("Progress: 0.0 %"),
                        SizedBox(
                          height: 20,
                        ),
                        LinearPercentIndicator(
                          lineHeight: 10.0,
                          percent: 0.0,
                          backgroundColor: Color(0xffC8E6C9),
                          progressColor: Color(0xff2BD26E),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
