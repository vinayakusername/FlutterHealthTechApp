
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CrudOperationMethods
{

   bool isLoggedIn()
   {
     if(FirebaseAuth.instance.currentUser()!=null)
     {
       return true;
     }
     else
     return false;
   }

  //To add car Information in firestore database
  Future<void> addData(carData) async
  {
    if(isLoggedIn())
    {
    /* This is one method to add data in firestore database*/
    //  Firestore.instance.collection('CarInformation')
    //                    .add(carData)
    //                    .catchError((e)
    //                    {
    //                      print(e);
    //                    });
    
    /*This below statement is another way to add data in firestore database -
    using Transaction it useful when we are dealing with large amount of data */

    Firestore.instance.runTransaction((Transaction crudTransaction) async {
      CollectionReference reference = await Firestore.instance.collection('CarInformation');
                         
                           reference.add(carData);
                      });
    }
    else
    print('You need to loggedIn first');
  }

  //Method To fecth data from firestore database
  getData() async
  {
    //Below statement will not give you real time functionality to view data
    //return await Firestore.instance.collection('CarInformation').getDocuments();

    //To get RealTime data we use streams and for streams we use snapshots

    return await Firestore.instance.collection('CarInformation').snapshots();
  }

  getSubCollectionCarData(docId) async
  {
    return await Firestore.instance
                          .collection('CarInformation')
                          .document(docId).
                          collection('CarDetails')
                          .snapshots();
  }

  getCarData() async
  {
    return await Firestore.instance
                          .collection('CarInformation')
                          .document('NgjtV2O00Sd9f60jbbJX')
                          .collection('CarDetails')
                          .snapshots();
  }


  updateData(selectedDocId,newValues)
  {
      Firestore.instance.collection('CarInformation')
                        .document(selectedDocId)
                        .updateData(newValues)
                        .catchError((e)
                        {
                          print(e);
                        });
  }

  deleteData(docId)
  {
    Firestore.instance.collection('CarInformation')
                      .document(docId)
                      .delete()
                      .catchError((e)
                      {
                        print(e);
                      });
  }
}