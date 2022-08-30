import 'package:flutter/material.dart';

class TokenCards extends StatelessWidget {
  final String icon;
  final String label;
  final String amount;
  const TokenCards(
      {Key? key, required this.icon, required this.label, required this.amount})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Color(0xFFF5F6FA),
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                  //extend the shadow
                  offset: Offset.zero)
            ],
            border: Border.all(
              color: const Color.fromARGB(255, 235, 235, 235),
            )),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(icon),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  amount,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                )
              ],
            )
          ],
        ));
  }
}
