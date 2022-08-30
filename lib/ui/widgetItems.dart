import 'package:flutter/material.dart';

class WidgetItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const WidgetItem(
      {Key? key,
      required this.icon,
      required this.label,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10),
        width: MediaQuery.of(context).size.width / 3.7,
        decoration: BoxDecoration(
            color: isActive
                ? const Color.fromARGB(255, 33, 80, 200)
                : Colors.white,
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : Colors.black87,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              label,
              style: TextStyle(color: isActive ? Colors.white : Colors.black38),
            )
          ],
        ));
  }
}
