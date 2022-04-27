import 'package:aerotrav/models/transaction_model.dart';
import 'package:aerotrav/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');
  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionReference.add({
        'destination': transaction.destination.toJson(),
        'amountOfTraveller': transaction.amountOfTraveller,
        'selectedSeats': transaction.selectedSeats,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchTransaction() async {
    try {
      QuerySnapshot result = await _transactionReference.get();

      List<TransactionModel> transactions = result.docs.map((t) {
        return TransactionModel.fromJson(
            t.id, t.data() as Map<String, dynamic>);
      }).toList();

      return transactions;
    } catch (e) {
      throw e;
    }
  }
}
