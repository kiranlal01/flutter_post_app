import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_post_app/_ui/text.dart';
import 'package:flutter_post_app/_ui/video.dart';

import 'image.dart';



class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var screen=[
    TextPage(),
    VideoPage(),
    ImagePage()
  ];
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,
        title: Text("Post App",style: TextStyle(color: Colors.white),),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        onTap: (tapindex){
          setState(() {
            index=tapindex;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.text_fields),label: 'Text'),
          BottomNavigationBarItem(icon: Icon(Icons.video_library),label: 'Video'),
          BottomNavigationBarItem(icon: Icon(Icons.image),label: 'Image'),
        ],

      ),
      body: Center(child: screen[index]),
    );
  }

  // void setState(Null Function() param0) {}
}