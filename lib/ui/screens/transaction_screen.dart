import 'package:aerotrav/cubit/transaction_cubit.dart';
import 'package:aerotrav/shared/theme.dart';
import 'package:aerotrav/ui/widgets/transaction_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          if (state.transactions.length == 0) {
            return Center(
              child: Text(
                'You Don\'t Have Any Transaction',
              ),
            );
          } else {
            return ListView.builder(
                padding: EdgeInsets.only(
                  left: defaultMargin,
                  right: defaultMargin,
                  bottom: 100,
                ),
                itemCount: state.transactions.length,
                itemBuilder: (context, index) {
                  return TransactionCard(
                      transaction: state.transactions[index]);
                });
          }
        }

        return Center(
          child: Text(
            'You Don\'t Have Any Transaction',
          ),
        );
      },
    );
  }
}
