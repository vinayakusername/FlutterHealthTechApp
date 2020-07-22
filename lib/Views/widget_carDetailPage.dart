import 'package:flutter/material.dart';
import 'package:health_tech_app1/Services_or_Utility/crudOperationsFile1.dart';

class CarDetailPage extends StatefulWidget {

   final String docId;
   CarDetailPage(this.docId);

  @override
  _CarDetailPageState createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {

  Stream carDetailInfo;
  CrudOperationMethods crudObj = new CrudOperationMethods();

  @override  
  void initState()
  {
     print(widget.docId);
     crudObj.getSubCollectionCarData(widget.docId)
            .then((value)
            {
               setState(() 
               {
                 carDetailInfo = value;
               });
            });

     super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
     appBar: AppBar
     (
       title: Text('Car Detail Page',style: TextStyle(color:Colors.white),),
       centerTitle: true,
       backgroundColor: Colors.pink,
     ),
     body:_carDetailList()  
    );
  }

  Widget _carDetailList()
  {
    if(carDetailInfo!=null)
    {
    return StreamBuilder
    (
      stream: carDetailInfo,
      builder: (context,snapshot)
      {
      return snapshot.data==null? 
        Center(child: CircularProgressIndicator()): 
        ListView.builder
        (
          itemCount: snapshot.data.documents.length,
          itemBuilder:(context,index)
          {
            return Card(
              child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          snapshot.data.documents[index].data['Model_No'],
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          snapshot.data.documents[index].data['price'],
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          snapshot.data.documents[index].data['company'],
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
            );
              
            
          
            // return Card
            // (
            //    margin: const EdgeInsets.all(5),
            //    child: Row(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: <Widget>
            //               [
            //                  Text(snapshot.data.documents[index].data['Model_No']),
            //                  Text(snapshot.data.documents[index].data['price']),
            //                  Text(snapshot.data.documents[index].data['company']),
            //               ],
            //              ),
            // );
          }
        );
      },
    );
    }
    else
    {
     return Center(child: CircularProgressIndicator());
    }
  }
}