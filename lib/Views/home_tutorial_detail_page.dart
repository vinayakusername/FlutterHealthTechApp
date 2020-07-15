import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:health_tech_app1/components/hero_widget.dart';

class HomeTutorialDetailPage extends StatelessWidget {


  final Object heroTag;
  final String desc;
  final String imageUrl;

  HomeTutorialDetailPage(
    {
      @required this.heroTag,
      @required this.desc,
      @required this.imageUrl
    });

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
         desc,
         style: TextStyle(fontSize: 20),
         textAlign: TextAlign.center,
       ),
     );
  }

  HeroWidget _buildHeroWidget(BuildContext context)
  {
     return HeroWidget
     (
       heroTag: heroTag,
       width: MediaQuery.of(context).size.width,
       builder: (BuildContext context)
       {
         return _buildHeroWidgetContent(imageUrl);
       }, 
     );
  }
  
  CachedNetworkImage _buildHeroWidgetContent(String imageUrl) 
  {
     return CachedNetworkImage
     (
       imageUrl: imageUrl,
       placeholder: (context,url)=> Center(child: CircularProgressIndicator())
       
     );
  }
}