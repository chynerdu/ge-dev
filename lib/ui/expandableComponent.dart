import 'package:flutter/material.dart';

class ExpandableComponent extends StatelessWidget {
  final String label;
  final String content;

  const ExpandableComponent(
      {Key? key, required this.label, required this.content})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 1,
        // margin: const EdgeInsets.symmetric(vertical: 6),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            iconColor: const Color(0xffA7A7A7),
            collapsedIconColor: const Color(0xffA7A7A7),
            title: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                label,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black54),
              ),
            ),
            children: [
              const SizedBox(height: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Text(content),
              ),
              const SizedBox(height: 6),
            ],
          ),
        ));
  }
}
