// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_ai_gpt/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:svg_flutter/svg.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.message,
    this.isMe = false,
  });

  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          decoration: BoxDecoration(
            color: isMe
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(16.0),
          ),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!isMe) ...[
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: SvgPicture.asset(
                    Assets.icons.icLogo,
                    width: 16.0,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                const SizedBox(width: 8.0)
              ],
              Flexible(
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChatLoading extends StatelessWidget {
  const ChatLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: SvgPicture.asset(
                  Assets.icons.icLogo,
                  width: 16.0,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              const SizedBox(width: 8.0),
              Flexible(
                child: SpinKitThreeBounce(
                  color: Theme.of(context).colorScheme.onBackground,
                  size: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
