import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoPlayerDemo extends StatefulWidget {
  @override
  _VideoPlayerDemoState createState() => _VideoPlayerDemoState();
}

class _VideoPlayerDemoState extends State<VideoPlayerDemo> {

   VideoPlayerController _controller;
   Future<void> _initializeVideoPlayerFuture;

  @override
  void initState()
  {
    //_controller = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _controller = VideoPlayerController.network('https://www.youtube.com/watch?v=1A7pM9Iu0pY');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);

    super.initState();
  }

  @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar
      (
        title: Text("Video Player"),
        centerTitle: true,
      ),

      body: Stack
      (
        children: <Widget>
      [

    Container(
      margin: EdgeInsets.symmetric(vertical:5.0),
      child: FutureBuilder
        (
          future: _initializeVideoPlayerFuture,
          builder: (context,snapshot)
          {
              if(snapshot.connectionState == ConnectionState.done)
              {
                return AspectRatio
                (
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              }
              else
              {
                return Center
                (
                  child: CircularProgressIndicator(),
                );
              }
          }
        ),
    ),

  Container
  (
    alignment: Alignment.center,
    child: RaisedButton
      (
        child: Icon(_controller.value.isPlaying? Icons.pause : Icons.play_arrow),
          onPressed:()
          {
              setState(() 
              {
                  if(_controller.value.isPlaying)
                  {
                    _controller.pause();
                  }
                  else
                  {
                    _controller.play();
                  }
              });
          },
        padding: EdgeInsets.all(16.0),
        shape: CircleBorder(),
        
      ),
    )
      // floatingActionButton: FloatingActionButton
      // (
      //   child: Icon(_controller.value.isPlaying? Icons.pause : Icons.play_arrow),
      //   onPressed:()
      //   {
      //       setState(() 
      //       {
      //           if(_controller.value.isPlaying)
      //           {
      //             _controller.pause();
      //           }
      //           else
      //           {
      //             _controller.play();
      //           }
      //       });
      //   }
      // ),
        
      ],
       
    )
    );
  }
}
