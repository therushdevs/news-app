import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}


class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  int counter = 0;
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  bool flag = false;
  hideBadge(){
    setState(() {
      flag = false;
      counter = 0;
    });

  }
  showBadge(){
    setState(() {
      counter = counter + 1;
      flag = true;
    });
  }
  @override
  Widget build(BuildContext context) {

    return  BottomAppBar(
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
                Badge(
                  animationType: BadgeAnimationType.scale,
                  showBadge: flag,
                  badgeColor: Colors.blue,
                  badgeContent:  Text(counter.toString(), style: TextStyle(color: Colors.black),),
                  child:  IconButton(onPressed: () {
                      hideBadge();
                    // Navigator.pushNamedAndRemoveUntil(context, "/home/", (route) => false);
                  }, icon:const Icon(Icons.home),
                  ),
                ),
                IconButton(onPressed: () {
                    showBadge();
                    // Navigator.pushNamedAndRemoveUntil(context, "/home/", (route) => false);
                  }, icon:const Icon(Icons.add),
                ),
          ],
      )
    );
  }
}
