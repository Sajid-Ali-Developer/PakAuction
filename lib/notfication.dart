import 'package:auctionapp/listmodels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Notification'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            width: 10,
          ),
          buildEventNoteListView(),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Widget buildEventNoteListView() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: event_listmodel.length,
      itemBuilder: (context, index) {
        return buildEventNoteListItem(context, index);
      },
    );
  }

  Widget buildEventNoteListItem(BuildContext context, int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      event_listmodel[index].ImagePath,
                    )),
                //borderRadius: BorderRadius.circular(1)
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event_listmodel[index].name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    event_listmodel[index].disc,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
