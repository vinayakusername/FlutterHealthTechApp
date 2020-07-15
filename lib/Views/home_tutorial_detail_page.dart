import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:health_tech_app1/components/hero_widget.dart';
import 'package:video_player/video_player.dart';


class HomeTutorialDetailPage extends StatefulWidget {

  final Object heroTag;
  final String desc;
  final String videoUrl;

  HomeTutorialDetailPage(
    {
      @required this.heroTag,
      @required this.desc,
      @required this.videoUrl
    });

  @override
  _HomeTutorialDetailPageState createState() => _HomeTutorialDetailPageState();
}

class _HomeTutorialDetailPageState extends State<HomeTutorialDetailPage> {
  
  
  ChewieController _chewieController;
 

  @override
  void initState()
  {
    super.initState();

  

     _chewieController = ChewieController
    (
      videoPlayerController: VideoPlayerController.network(widget.videoUrl),
      //below code is for picking video from phone gallery
      //videoPlayerController: VideoPlayerController.file(File(widget.videoUrl)),
      aspectRatio: 16/9,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      errorBuilder: (context,errorMessage)
      {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(errorMessage,style: TextStyle(color: Colors.black)),
          ),
        );
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text('Tutorial Detail'),
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context)
  {
     return SingleChildScrollView
     (
       child: Column
       (
         children: <Widget>
         [
           _buildHeroWidget(context),
           _buildDesc(),
         ],
       ),
     );
  }

  Widget _buildDesc()
  {
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Text
       (
         widget.desc,
         style: TextStyle(fontSize: 20),
         textAlign: TextAlign.center,
       ),
     );
  }

  HeroWidget _buildHeroWidget(BuildContext context)
  {
     return HeroWidget
     (
       heroTag: widget.heroTag,
       width: MediaQuery.of(context).size.width,
       builder: (BuildContext context)
       {
         return _buildHeroWidgetContent();
       }, 
     );
  }
 
  Chewie _buildHeroWidgetContent() 
  {
     return Chewie
     (
       controller: _chewieController,
     );
  }

@override
  void dispose()
  {
    _chewieController.videoPlayerController.dispose();
    _chewieController.dispose();
    
    super.dispose();
  }
}



