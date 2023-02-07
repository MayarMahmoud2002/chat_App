import 'package:chat_app/models/room.dart';
import 'package:flutter/material.dart';

class RoomWidget extends StatelessWidget {
  Rooms room;
  RoomWidget (this.room);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 15.0,
        color: Colors.white,
        child: Container(
          // padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: [
              Image.asset("assets/images/${room.CatId}.png",
                width: 200.0,
                height: 100.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(room.title,style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),),


            ],
          ),
        ),
      ),
    );
  }
}
