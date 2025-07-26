import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add a meal
  Future<void> addMeal(Map<String, dynamic> meal) async {
    await _db.collection('meals').add(meal);
  }

  // Fetch all meals
  Stream<List<Map<String, dynamic>>> getMeals() {
    return _db
        .collection('meals')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  // Add a ticket
  Future<void> addTicket(Map<String, dynamic> ticket) async {
    await _db.collection('tickets').add(ticket);
  }

  // Fetch all tickets
  Stream<List<Map<String, dynamic>>> getTickets() {
    return _db
        .collection('tickets')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }
}
