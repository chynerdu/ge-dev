import 'package:flutter/material.dart';

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({Key? key}) : super(key: key);

  Widget _actionButton({required IconData icon, required String label}) {
    return GestureDetector(
        child: Container(
            width: 100,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 6, 49, 124),
                borderRadius: BorderRadius.circular(3)),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 18,
                  color: Colors.white,
                ),
                const SizedBox(width: 5),
                Text(label, style: const TextStyle(color: Colors.white))
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Hello!',
            style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        const Text('3J98t1WpEZ73CNmQviecrnyiWrnqRhWNLy. Bech32 ',
            style: TextStyle(
                color: Colors.white, fontSize: 11, letterSpacing: 0.7)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _actionButton(icon: Icons.copy, label: 'copy'),
            const SizedBox(width: 10),
            _actionButton(icon: Icons.upload_file, label: 'share')
          ],
        ),
        const SizedBox(height: 30),
        Image.asset(
          'assets/icons/qrcode.png',
          width: 200,
        ),
        const SizedBox(height: 25),
        const Text('Your QR Code', style: TextStyle(color: Colors.white))
      ],
    );
  }
}
