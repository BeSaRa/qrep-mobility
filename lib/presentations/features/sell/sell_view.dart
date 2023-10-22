import 'package:ebla/presentations/features/sell/blocs/bloc/sell_bloc.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SalesView extends StatefulWidget {
  const SalesView({super.key});

  @override
  State<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<SalesView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<SellBloc>(),
      builder: (context, SellState state) {
        return state.map(
          loadingSellLookup: (value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loadedSellLookup: (value) {
            return const Center(
              child: Text('Success LookUp Sell '),
            );
          },
          errorSellLookUp: (value) {
            return Center(
              child: Container(
                child: const Text('Error LookUp Sell '),
              ),
            );
          },
        );
      },
    );
  }
}
