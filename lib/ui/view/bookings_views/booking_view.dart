import 'package:flutter/material.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => Container(),
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: 10);
  }
}
