import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> checkIfEntryExists(
    String collectionName, String fieldName, dynamic value) async {
  var querySnapshot = await FirebaseFirestore.instance
      .collection(collectionName)
      .where(fieldName, isEqualTo: value)
      .limit(1)
      .get();

  return querySnapshot.docs.isNotEmpty;
}

Future<int?> documentCount(String collectionName) async {
  AggregateQuerySnapshot query =
      await FirebaseFirestore.instance.collection(collectionName).count().get();
  return query.count;
}

Future<void> setEntryField(String entry, String value, String field) async {

  if (await checkIfEntryExists("locations", entry, value)) {
    var querySnapshot = await FirebaseFirestore.instance
      .collection("locations")
      .where(entry, isEqualTo: value)
      .limit(1)
      .get();

      var documentSnapshot = querySnapshot.docs.first;
    // check if the field exists
    if (documentSnapshot.data().containsKey(field)) {
      String fieldVal = documentSnapshot.get(field);

      // The field exists but is either null or empty
      if (fieldVal == null || (fieldVal.trim().isEmpty)) {
        await FirebaseFirestore.instance
          .collection("locations")
          .doc('your_document_id')
          .update({'your_key': 'your_value'});
        }
    }
    // field does not exist, set it

  }
  // field doesn't exist - just create a new one?
}

Future<Map<String, dynamic>?> getEntryByIndex(
    String collectionName, int index) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection(collectionName)
      .orderBy(FieldPath
          .documentId) // Change this field if you need a specific order
      .limit(index + 1) // Fetch documents up to the desired index
      .get();

  if (querySnapshot.docs.length > index) {
    return querySnapshot.docs[index].data()
        as Map<String, dynamic>; // Convert to JSON
  } else {
    return null; // Index out of range
  }
}

Future<void> deleteEntryWhere(
    String collectionName, String fieldName, dynamic value) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection(collectionName)
      .where(fieldName, isEqualTo: value)
      .get();

  for (DocumentSnapshot doc in querySnapshot.docs) {
    await doc.reference.delete();
  }
}
