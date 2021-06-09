import 'package:flutter/material.dart';
import 'package:project_1/demoRepo/notificationRepo.dart';
import 'package:project_1/shared/NavigationDrawer/app_drawer.dart';
import 'package:project_1/shared/constants.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: SharedConstants().yellow,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'NOTIFICATIONS',
          style: TextStyle(
            fontSize: 25,
            color: SharedConstants().purple,
            fontFamily: 'Bison',
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        padding: EdgeInsets.symmetric(vertical: 15.0),
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[100],
                  backgroundImage:
                      AssetImage(NotificationRepo().client[index].clientImage),
                ),
                title: Text(
                  NotificationRepo().client[index].fullName,
                  style: TextStyle(fontFamily: 'OP_S', fontSize: 18),
                ),
                subtitle: Text(
                  'Has Booked your car.',
                  style: TextStyle(fontSize: 16),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey[400],
              );
            },
            itemCount: NotificationRepo().client.length),
      ),
    );
  }
}
