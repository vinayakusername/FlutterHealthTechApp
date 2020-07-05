import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  File imageFile;
  File videoFile;

  _camera() async
  {
    File theImage = await ImagePicker.pickImage(source: ImageSource.camera);
    if(theImage!=null)
    {
       setState(() 
       {
          imageFile = theImage;  
       });
    }
  }

   _picture() async
  {
    File theImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    if(theImage!=null)
    {
       setState(() 
       {
          imageFile = theImage;  
       });
    }
  }

  _videoPic() async
  {
    File theVideo = await ImagePicker.pickVideo(source: ImageSource.gallery);
    if(theVideo!=null)
    {
      setState(() 
      {
        videoFile = theVideo;  
      });
    }
  }


   _recordVideo() async
  {
    File theVideo = await ImagePicker.pickVideo(source: ImageSource.camera);
    if(theVideo!=null)
    {
      setState(() 
      {
        videoFile = theVideo;  
      });
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: Center
      (
        child: ListView
        (
          children: <Widget>
          [
           
            Column
            (
              children: <Widget>
              [
               SizedBox
                (
                   height: 50.0,
                 ),
              // Code Display and Play video
             
                Container
                (
                  color: Colors.brown,
                  height: MediaQuery.of(context).size.height*(30/100),
                  width: MediaQuery.of(context).size.width*(100/100),
                  child: videoFile==null ? Center
                  (
                    child:Icon(Icons.videocam,color:Colors.red,size:50.0)
                  ):
                  FittedBox
                  (
                    fit: BoxFit.contain,
                    child: mounted ? Chewie
                    (
                      controller: ChewieController
                      (
                        videoPlayerController: VideoPlayerController.file(videoFile),
                        aspectRatio: 3/2,
                        autoPlay: true,
                        looping: true
                      ),
                    ):Container()
                  )
                ),

                Container
                (
                  color: Colors.lightGreen,
                  height: MediaQuery.of(context).size.height*(30/100),
                  width: MediaQuery.of(context).size.width*(100/100),
                  child: FittedBox
                  (
                    fit: BoxFit.contain,
                    child: imageFile == null ? Center
                    (
                      child: Icon(Icons.photo,color:Colors.blueAccent),
                    ): Image.file(imageFile),
                  ) ,
                ),

                 RaisedButton
                 (
                   child: Row
                   (
                     mainAxisSize: MainAxisSize.min,
                     children: <Widget>
                     [
                       Text("Camera"),
                       Icon(Icons.camera)
                     ],
                   ),
                   onPressed:()=> _camera()
                 ),

                RaisedButton
                 (
                   child: Row
                   (
                     mainAxisSize: MainAxisSize.min,
                     children: <Widget>
                     [
                       Text("Picture"),
                       Icon(Icons.photo_camera)
                     ],
                   ),
                   onPressed:()=> _picture()
                 ),

                RaisedButton
                 (
                   child: Row
                   (
                     mainAxisSize: MainAxisSize.min,
                     children: <Widget>
                     [
                       Text("Video"),
                       Icon(Icons.video_library)
                     ],
                   ),
                   onPressed: () => _videoPic()
                 ),

                RaisedButton
                 (
                   child: Row
                   (
                     mainAxisSize: MainAxisSize.min,
                     children: <Widget>
                     [
                       Text("Record"),
                       Icon(Icons.videocam)
                     ],
                   ),
                   onPressed: () => _recordVideo()
                 )

              ],
            )
          ],
        ),
      ),
    );
  }
}
