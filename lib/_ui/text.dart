import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class TextPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text("Hi, This is a Post App",style: TextStyle(fontSize: 20,color: Colors.white),),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  Share.share('Check out this awesome website: https://example.com');
                },
                child: Text("Share"))
          ],
        ),
      ),
    );
  }


}