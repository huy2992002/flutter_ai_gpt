// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ai_gpt/components/ag_snackbar.dart';
import 'package:flutter_ai_gpt/components/ag_text_form_field.dart';
import 'package:flutter_ai_gpt/constants/ag_text.dart';
import 'package:flutter_ai_gpt/gen/assets.gen.dart';
import 'package:flutter_ai_gpt/models/message_model.dart';
import 'package:flutter_ai_gpt/screens/home/widgets/chat_item.dart';
import 'package:flutter_ai_gpt/services/remote/message_services.dart';
import 'package:flutter_ai_gpt/utils/maths.dart';
import 'package:svg_flutter/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MessageServices messageServices = MessageServices();
  TextEditingController submitController = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<MessageModel> messages = [];
  String allMessages = '';
  bool isLoading = false;
  bool isDark = false;

  void moveScrollController() {
    Timer(
      const Duration(milliseconds: 300),
      () => scrollController.jumpTo(scrollController.position.maxScrollExtent),
    );
  }

  Future<void> onSubmit() async {
    setState(() => isLoading = true);
    addMessage(messageSubmit: submitController.text);
    submitController.clear();
    await getAnswer(allMessages);
    setState(() => isLoading = false);
  }

  void addMessage({required String messageSubmit, bool? isMe}) {
    messages.add(
      MessageModel(
        id: Maths.randomUUid(),
        message: messageSubmit,
        isMe: isMe ?? true,
      ),
    );
    allMessages = '$allMessages $messageSubmit';
    moveScrollController();
    setState(() {});
  }

  Future<void> getAnswer(String question) async {
    try {
      String answer = await messageServices.postQuestion(question);
      addMessage(messageSubmit: answer, isMe: false);
    } catch (e) {
      AGSnackBar.snackbarDefault(context, title: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        // appBar: AppBar(
        //   toolbarHeight: 38,
        //   backgroundColor: Theme.of(context).colorScheme.background,
        //   surfaceTintColor: Colors.transparent,
        //   actions: [
        //     AGSwitch(
        //       onChanged: () {
        //         setState(() {
        //           isDark = !isDark;
        //         });
        //       },
        //       isDark: isDark,
        //     ),
        //     const SizedBox(width: 10),
        //   ],
        // ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0)
              .copyWith(top: 40, bottom: 23.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.icLogo,
                        width: 30.0,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: Text(
                          AGText.welcomeApp,
                          style: Theme.of(context).textTheme.displayMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        AGText.askAnyThing,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 24.0),
                      ListView.separated(
                        itemCount:
                            isLoading ? messages.length + 1 : messages.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(bottom: 20.0),
                        itemBuilder: (context, index) {
                          if (index == messages.length) {
                            return const ChatLoading();
                          } else {
                            final message = messages[index];
                            return ChatItem(
                              message: message.message,
                              isMe: message.isMe,
                            );
                          }
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20.0),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.paddingOf(context).bottom,
                ),
                child: AGTextFormField(
                  controller: submitController,
                  onTap: moveScrollController,
                  onSubmit: isLoading ? null : onSubmit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    submitController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
