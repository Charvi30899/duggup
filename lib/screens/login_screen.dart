import 'package:duggup/utilities/app_assets.dart';
import 'package:duggup/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_btn.dart';
import '../widgets/email_text_field.dart';
import '../widgets/password_text_field.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginBg,
      body: bodyWidget(),
    );
  }

  Widget bodyWidget() {
    double hg = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Center(
            child: SizedBox(
              height: 50,
              width: wid / 2,
              child: Image(
                image: AssetImage(
                  AppAssets.logo,
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Stack(
            children: [
              logInFieldsView(),
            ],
          )
        ],
      ),
    );
  }

  Widget logInFieldsView() {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 100, 24, 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleText('Email'),
          const SizedBox(
            height: 5,
          ),
          EmailTextField(
            controller: emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          titleText('Password'),
          const SizedBox(
            height: 5,
          ),
          PasswordTextField(
            controller: passwordController,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            borderColor: AppColors.btnColor,
            btnColor: AppColors.btnColor,
            fontColor: Colors.white,
            fontSize: 14,
            fontw: FontWeight.w600,
            radius: 50.0,
            hg: 40.0,
            title: 'Continue with Email',
            onClick: () {
              Get.offAll(const HomeScreen());
            },
          ),
          const SizedBox(
            height: 30,
          ),
          richTextView(),
        ],
      ),
    );
  }

  Widget richTextView() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text:
                'By continuing, you acknowledge that you have read and understood, and agree to Duggup’s ',
            style: greyTextStyle,
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {},
              child: Text('Terms of Service', style: blackTextStyle),
            ),
          ),
          TextSpan(
            text: ' and ',
            style: greyTextStyle,
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {},
              child: Text('Privacy Policy.', style: blackTextStyle),
            ),
          ),
        ],
      ),
    );
  }

  Widget titleText(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
    );
  }

  TextStyle greyTextStyle = TextStyle(
    color: AppColors.greyText,
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );

  TextStyle blackTextStyle = TextStyle(
    decoration: TextDecoration.underline,
    decorationColor: AppColors.black,
    color: AppColors.black,
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );
}
