import 'package:flutter/material.dart';

class TokenDisc extends StatelessWidget {
  const TokenDisc({
    super.key,
    required this.tokensLeft,
  });

  final int tokensLeft;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.cyan.shade900.withAlpha(100),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Tokens left:',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ProductSanPro',
                  ),
                ),
                const Spacer(),
                Text(
                  '$tokensLeft/4096',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 4)
              ],
            ),
            const Divider(color: Colors.white30),
            const Text(
              'Disclaimer:',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'ProductSanPro',
              ),
            ),
            const Text(
              'This is an app developed to showcase API calls and is not intended to be an official Google product. I do not own Google\'s PaLM AI model, nor do I own MakerSuite. This app is not affiliated with Google in any way.',
              style: TextStyle(
                color: Colors.white70,
                fontFamily: 'SFProDisplay',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
