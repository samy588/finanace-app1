import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String userName = 'Ganesh';
  List<String> notificationDetails = [
    'Notification Details',
    'Notification Details',
    'Notification Details',
    'Notification Details',
    'Notification Details',
    'Notification Details',
    'Notification Details',
    'Notification Details',
    'Notification Details',
    'Notification Details',
    'Notification Details',
    'Notification Details',
    'Notification Details',
    'Notification Details',
    'Notification Details',
    'Notification Details',
    'Notification Details',
    'Notification Details',
    'Notification Details',
    'Notification Details',
    'Notification Details',
    'Notification Details',
  ];

  @override
  Widget build(BuildContext context) {
    double tileHeight = MediaQuery
        .of(context)
        .size
        .height;
    double tileWidth = MediaQuery
        .of(context)
        .size
        .width;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy (EEE)').format(now);
    return Scaffold(
      appBar: AppBar(
        title: Text('NOTIFICATIONS'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                        color: Color(0xff373D3F), fontSize: tileWidth * 0.05),
                  ),
                  Text(
                    'as on $formattedDate',
                    style: TextStyle(
                        color: Color(0xff373D3F), fontSize: tileWidth * 0.05),
                  ),
                  SizedBox(height: 8,),
                  Divider(),
                  SizedBox(height: 8,),
                  Container(
                    height: tileHeight*0.8,
                    width: tileWidth,
                    child: ListView(children: List.generate(
                        notificationDetails.length, buildNotificationTile),),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildNotificationTile(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 10.0,),
              Text(notificationDetails[index],
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff373D3F),
                ),
              ),
              SizedBox(width: 10.0,),
              Expanded(
                child: GestureDetector(
                    child:Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(Icons.keyboard_arrow_right,
                          color: Colors.black26,),),
                  onTap: (){},
                ),
              ),
        ],
      ),
          Divider(),
      ],
    ),
    );
  }
}