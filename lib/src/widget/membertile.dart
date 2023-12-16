import 'package:BuffedUp/const/DataTypes.dart';
import 'package:BuffedUp/src/screens/members/editmemberscreen.dart';
import 'package:BuffedUp/src/screens/members/viewmemberscreen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class membertile extends StatelessWidget {
  GymMember member;
  membertile(this.member,{ super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => viewmemberscreen(member))),
        leading: CircleAvatar(child: Text(member.name.substring(0, 1))),
        title: Text(member.name),
        subtitle: Text("Register Number: ${member.registerNumber.toString()}"),
        trailing: IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => editmemberscreen(member))),
            icon: Icon(Icons.edit)),
      ),
    );
  }
}
