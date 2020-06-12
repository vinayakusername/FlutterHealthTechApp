import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods
{
  // this method is used to add data in firstore and it will generate unique id for that data
  Future<void> addData(carData) async{

     print(carData);
     Firestore.instance.collection('CarInfo').add(carData);
    //  Firestore.instance.collection('CarInfo').add(carData).catchError(
    //   (e)
    //   {
    //     print("Error Message"+e);
    //   });
     
    //Add Data Using Transactions in firestore database

    // Firestore.instance.runTransaction((Transaction crudTransaction) async
    // {
    //     CollectionReference collectionReference = await Firestore.instance.collection('CarInfo');
    //     collectionReference.add(carData);
    // });

  }

  // Below method is used to fetch the data from firestore And 
  //it will give all the data which is store in this collection 

 getData() async
  {
    // below statement will be use with QuerySnapshot
    //return await Firestore.instance.collection('CarInfo').getDocuments();

    // below query will be use with streams for giving realtime data
    return await Firestore.instance.collection("CarInfo").snapshots(); 
  }

  //Below method is define for updating data in firestore database

  Future <void>updateData(selectedDoc,newValues) async
  {
    await Firestore.instance.collection('CarInfo').document(selectedDoc)
                   .updateData(newValues).catchError((e){print("Error Message"+e);});
  }

  Future<void> deleteData(docID) async
  {
    await Firestore.instance.collection('CarInfo').document(docID)
                  .delete().catchError((e){print("Error Message"+e);});
  }
}