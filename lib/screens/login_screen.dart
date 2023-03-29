import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_screen/constants.dart';
import 'package:login_screen/utils/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isInSignInScreen = true;
  final _scrollController = ScrollController();
  bool isLoading = false;

  loading() async {
    setState(() {
      isLoading = true;
    });
    await Future<void>.delayed(const Duration(seconds: 3));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                children: [
                  buildSvpPicture(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildTextSignIn(context),
                              buildTextSignUp(context),
                            ],
                          ),
                          const Spacer(),
                          _isInSignInScreen
                              ? Column(
                                  children: [
                                    buildEmailSignInField(),
                                    buildPasswordSignInField(),
                                  ],
                                )
                              : Column(
                                  children: [
                                    buildUsernameSignUpField(),
                                    buildEmailSignUpField(),
                                    buildPasswordSignUpField(),
                                  ],
                                ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: Row(
                              children: [
                                buildGithubSvg(),
                                const SizedBox(width: 20.0),
                                buildTwitterSvg(),
                                const Spacer(),
                                _isInSignInScreen
                                    ? buildSignInSubmitButton()
                                    : buildSignUpButton()
                              ],
                            ),
                          )
                        ],
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
  }

  Container buildSignUpButton() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: kPrimaryColor,
      ),
      child: const Icon(Icons.arrow_forward),
    );
  }

  GestureDetector buildSignInSubmitButton() {
    return GestureDetector(
      onTap: loading,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: kPrimaryColor,
        ),
        child: isLoading
            ? const Center(
                child: SizedBox(
                  height: 23.0,
                  width: 23.0,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 3.0,
                  ),
                ),
              )
            : const Icon(Icons.arrow_forward),
      ),
    );
  }

  Container buildTwitterSvg() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(0.5),
        ),
      ),
      child: SvgPicture.asset(
        'assets/twitter.svg',
        color: Colors.white.withOpacity(0.5),
      ),
    );
  }

  Container buildGithubSvg() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(0.5),
        ),
      ),
      child: SvgPicture.asset(
        'assets/github.svg',
        color: Colors.white.withOpacity(0.5),
      ),
    );
  }

  InputField buildPasswordSignUpField() {
    return InputField(
      icon: Icons.lock,
      isPasswordField: true,
      textInputType: TextInputType.text,
      hintText: 'Password',
      scrollController: _scrollController,
    );
  }

  Padding buildEmailSignUpField() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20.0,
      ),
      child: InputField(
        icon: Icons.alternate_email,
        textInputType: TextInputType.emailAddress,
        hintText: 'Email adress',
        scrollController: _scrollController,
      ),
    );
  }

  Padding buildUsernameSignUpField() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20.0,
      ),
      child: InputField(
        icon: Icons.person,
        textInputType: TextInputType.emailAddress,
        hintText: 'Username',
        scrollController: _scrollController,
      ),
    );
  }

  InputField buildPasswordSignInField() {
    return InputField(
      icon: Icons.lock,
      isPasswordField: true,
      textInputType: TextInputType.text,
      hintText: 'Password',
      scrollController: _scrollController,
    );
  }

  Padding buildEmailSignInField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: InputField(
        icon: Icons.alternate_email,
        textInputType: TextInputType.emailAddress,
        hintText: 'Email adress',
        scrollController: _scrollController,
      ),
    );
  }

  InkWell buildTextSignUp(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        _isInSignInScreen = false;
      }),
      child: Text(
        'Sign up'.toUpperCase(),
        style: !_isInSignInScreen
            ? Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: kPrimaryColor)
            : const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
      ),
    );
  }

  InkWell buildTextSignIn(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        _isInSignInScreen = true;
      }),
      child: Text(
        'Sign in'.toUpperCase(),
        style: _isInSignInScreen
            ? Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: kPrimaryColor)
            : const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
      ),
    );
  }

  Expanded buildSvpPicture() {
    return Expanded(
      flex: 1,
      child: _isInSignInScreen
          ? Container(
              padding: const EdgeInsets.all(0.0),
              child: SvgPicture.asset('assets/login.svg'),
            )
          : Container(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset('assets/register.svg'),
            ),
    );
  }
}
