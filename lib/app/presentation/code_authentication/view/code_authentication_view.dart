// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:seek_qr_reader/app/app_colors.dart';
import 'package:seek_qr_reader/app/app_navigation.dart';

import '../bloc/bloc.dart';

class CodeAutheticationView extends StatelessWidget {
  const CodeAutheticationView({super.key});

  @override
  Widget build(BuildContext context) {
    final codeAuthenticationBloc = context.read<CodeAuthenticationBloc>();
    List<TextEditingController> controllers = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ];

    void goToHome() async {
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushReplacementNamed(context, Routes.HOME);
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter your secure code',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text('Your actual secure code is 0000.'),
                SizedBox(height: 56),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8.0,
                  children: List.generate(
                    4,
                    (int i) => Container(
                      height: 56,
                      width: 56,
                      alignment: Alignment.center,
                      child: CupertinoTextField(
                        controller: controllers[i],
                        keyboardType: TextInputType.number,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(color: AppColors.primary),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.deny(' '),
                        ],
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            if (value.length != 1 &&
                                value.length != 4 &&
                                i == 0) {
                              if (controllers[1].text.isNotEmpty) {
                                FocusScope.of(context).unfocus();
                              }
                              if (controllers[1].text.isEmpty) {
                                FocusScope.of(context).nextFocus();
                              }
                            }
                            if (value.length == 1) {
                              if (i == 4) {
                                FocusScope.of(context).unfocus();
                              }
                              if (i != 4) {
                                FocusScope.of(context).nextFocus();
                              }
                            }
                          }
                          if (value.isEmpty) {
                            if (i == 0) {
                              FocusScope.of(context).unfocus();
                            }
                            if (i != 0) {
                              FocusScope.of(context).previousFocus();
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ),

                BlocBuilder<CodeAuthenticationBloc, CodeAuthenticationState>(
                  builder: (context, state) {
                    if (state is CodeAuthenticationStateLogin) {
                      if (state.isAuthenticated) {
                        goToHome();
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        );
                      }
                    }
                    if (state is CodeAuthenticationStateLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      );
                    }
                    return Expanded(
                      child: Column(
                        children: [
                          Text(
                            state is CodeAuthenticationStateLogin &&
                                    state.isAuthenticated == false
                                ? 'Wrong secure code'
                                : '',
                            style: TextStyle(color: AppColors.error),
                          ),
                          Spacer(),
                          MaterialButton(
                            onPressed: () {
                              if (controllers[0].text.isNotEmpty &&
                                  controllers[1].text.isNotEmpty &&
                                  controllers[2].text.isNotEmpty &&
                                  controllers[3].text.isNotEmpty) {
                                codeAuthenticationBloc.add(
                                  Login(
                                    code:
                                        '${controllers[0].text}${controllers[1].text}${controllers[2].text}${controllers[3].text}',
                                  ),
                                );
                              }
                            },
                            color: AppColors.primary,
                            shape: StadiumBorder(),
                            minWidth: double.infinity,
                            height: 50,
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                color: AppColors.inverse,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
