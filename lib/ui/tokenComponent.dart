import 'dart:ui';

import 'package:flutter/material.dart';

import 'expandableComponent.dart';
import 'tokenCards.dart';

class TokenComponent extends StatelessWidget {
  const TokenComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> _filter(context) async {
      return (await showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: AlertDialog(
                content: const SizedBox(
                    height: 230,
                    child: Center(child: Text('FIlter coming soon'))),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          )) ??
          false;
    }

    return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(26, 207, 228, 255),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                      width: 0.5, color: Color(0xffAEAEAE)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                      width: 0.5, color: Color(0xffAEAEAE)),
                                ),
                                prefixIcon: const Icon(Icons.search),
                                labelText: 'Search'))),
                    Expanded(
                        child: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              _filter(context);
                            },
                            child: const Icon(Icons.filter_list))),
                  ],
                ),
                const SizedBox(height: 20),
                ListView(
                  padding: const EdgeInsets.only(top: 0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: const [
                    TokenCards(
                      icon: 'assets/icons/btc.jpg',
                      label: 'Waves',
                      amount: '5.0054',
                    ),
                    TokenCards(
                        icon: 'assets/icons/btc2.png',
                        label: 'Pigeon/My Token',
                        amount: '1444.04556321'),
                    TokenCards(
                        icon: 'assets/icons/btc.jpg',
                        label: 'US Dollar',
                        amount: '199.24'),
                  ],
                ),
                const ExpandableComponent(
                  label: 'Hidded tokens (2)',
                  content: 'Nothing to show',
                ),
                const ExpandableComponent(
                  label: 'Suspicious tokens (16)',
                  content: 'Nothingto show',
                )
              ],
            )));
  }
}
