import 'package:ciyu/pages/recommend_page.dart';
import 'package:ciyu/pages/register_page.dart';
import 'package:ciyu/styles/theme.dart';
import 'package:ciyu_api/ciyu_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:io';

import '../load.dart';
import '../providers/token_provider.dart';

class LoginPage extends StatefulHookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final phoneController = useTextEditingController();
    final passwordController = useTextEditingController();
    ref.listen(loginStatusProvider, (previous, next) {
      if (next == LoginStatus.success)
        Navigator.of(context).pushAndRemoveUntil(RecommendPage.route(), (route) => false);
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 64),
                    Text(
                      "词遇",
                      style: textTheme.displayMedium,
                    ),
                    SizedBox(height: 48),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "手机号",
                      ),
                      controller: phoneController,
                    ),
                    SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "密码",
                      ),
                      controller: passwordController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            // onPressed: loading
                            //     ? () {}
                            //     : () {
                            //         loginAuth();
                            //       },
                            onPressed: null,
                            child: loading
                                ? CircularProgressIndicator()
                                : Text("本机号码一键登录"),
                          ),
                        ),
                        SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            ref.watch(loginStatusProvider.notifier).login(
                                phoneController.text, passwordController.text);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(CircleBorder()),
                          ),
                          child:
                              ref.watch(loginStatusProvider) == LoginStatus.loading
                                  ? SizedBox.square(
                                      dimension: 24,
                                      child: CircularProgressIndicator(
                                          color: Colors.white),
                                    )
                                  : SvgPicture.asset(
                                      "svgs/arrow_right.svg",
                                      color: Colors.white,
                                    ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TextButton(onPressed: () => Navigator.of(context).pushAndRemoveUntil(RegisterPage.route(), (route) => false), child: Text("新账号注册", style: textTheme.bodyMedium)),
            ],
          ),
        ),
      ),
    );
  }
}
