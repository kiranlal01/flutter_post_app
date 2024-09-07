import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ImagePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200,),
            Image(image: AssetImage("assets/img/tree.jpg"),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              Share.share('Check out this awesome website: https://example.com');
              // final image = await ImagePicker().pickImage(source: "")
            }, child: Text("Share"))
          ],
        ),),
    );
  }

}