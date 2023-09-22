import 'package:flutter/material.dart';

Widget formatString(String input) {
  final List<TextSpan> textSpans = [];
  final RegExp boldRegExp = RegExp(r'\*\*(.*?)\*\*');
  final RegExp italicRegExp = RegExp(r'\*(.*?)\*');

  int currentPosition = 0;

  while (currentPosition < input.length) {
    final boldMatch = boldRegExp.firstMatch(input);
    final italicMatch = italicRegExp.firstMatch(input);

    if (boldMatch != null && boldMatch.start == currentPosition) {
      textSpans.add(TextSpan(
        text: boldMatch.group(1),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ));
      currentPosition = boldMatch.end;
    } else if (italicMatch != null && italicMatch.start == currentPosition) {
      textSpans.add(TextSpan(
        text: italicMatch.group(1),
        style: const TextStyle(fontStyle: FontStyle.italic),
      ));
      currentPosition = italicMatch.end;
    } else {
      // No special formatting, just add the text as is
      final nextWhiteSpace = input.indexOf(' ', currentPosition);
      final end = nextWhiteSpace == -1 ? input.length : nextWhiteSpace;
      textSpans.add(TextSpan(text: input.substring(currentPosition, end)));
      currentPosition = end;
    }
  }

  return RichText(
    text: TextSpan(children: textSpans),
  );
}
