import 'dart:developer';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../data/repo/auth_repo_impl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/params.dart';
import '../view_model/auth_bloc.dart';
import '../view_model/auth_event.dart';
import '../view_model/auth_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  State<LoginView> get state => _LoginViewState();

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _isPasswordVisible = true;

  _changePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(AuthRepositoryImpl()),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoginSuccess) {
            log('login success');
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.homeRoute,
              (route) => false,
            );
          }
          if (state is AuthLoginFailure) {
            // SharedWidget.toast(
            //   message: state.message,
            //   backgroundColor: Colors.red,
            // );
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              elevation: AppSize.s0,
            ),
            body: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    AssetsManager.vectorImage,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: MediaQuery.of(context).size.width / AppSize.s10,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          AssetsManager.loginTopImage,
                          height:
                              MediaQuery.of(context).size.height / AppSize.s6,
                          alignment: Alignment.center,
                          fit: BoxFit.fitHeight,
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height / AppSize.s20,
                        ),
                        Text(
                          AppLocalizations.of(context)!.loginDetails,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp,
                              ),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height / AppSize.s30,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          validator: (p0) => p0!.isEmpty
                              ? AppLocalizations.of(context)!.thisIsRequired
                              : null,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.email,
                          ),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height / AppSize.s60,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _isPasswordVisible,
                          controller: _passwordController,
                          validator: (p0) => p0!.isEmpty
                              ? AppLocalizations.of(context)!.thisIsRequired
                              : null,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.password,
                            suffixIcon: IconButton(
                              onPressed: _changePasswordVisibility,
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height / AppSize.s30,
                        ),
                        if (state is AuthLoginLoading)
                          const Center(
                            child: CircularProgressIndicator(
                                // color: ColorManager.primaryColor,
                                ),
                          )
                        else
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                return AuthBloc(AuthRepositoryImpl()).add(
                                  AuthLoginEvent(
                                    context: context,
                                    params: LoginParams(
                                        email: _emailController.text,
                                        password: _passwordController.text),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.mintGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppSize.s10.w,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: MediaQuery.of(context).size.height /
                                    AppSize.s60,
                              ),
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.login,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.white,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
