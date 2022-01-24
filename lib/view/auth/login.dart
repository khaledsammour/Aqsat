import 'package:aqsat/constance.dart';
import 'package:aqsat/core/viewmodel/auth_view_model.dart';
import 'package:aqsat/helper/internetConnection.dart';
import 'package:aqsat/view/auth/register_View.dart';
import 'package:aqsat/view/widget/custom_butoon.dart';
import 'package:aqsat/view/widget/custom_button_social.dart';
import 'package:aqsat/view/widget/custom_text.dart';
import 'package:aqsat/view/widget/custom_text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Login extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GetXNetworkManager _networkManager = Get.find<GetXNetworkManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GetXNetworkManager>(
          builder: (builder) => (_networkManager.connectionType == 0)
              ? CustomText(
                  title: "No Connection",
                  alignment: Alignment.center,
                )
              : _newBody()),
    );
  }

  Widget _newBody() {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        child: Form(
          key: _formkey,
          child: Stack(
            children: [
              Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x662f2e3f),
                        Color(0x992f2e3f),
                        Color(0xcc2f2e3f),
                        Color(0xff2f2e3f)
                      ],
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign IN",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        _buildPassword(),
                        _buildForgetPassword(),
                        _buildLoginButton(),
                        _buildSignUpButton(),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPassword() {
    return AutofillGroup(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ]),
            height: 60,
            child: TextField(
              onChanged: (value) {
                controller.email = value;
              },
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black87),
              autofillHints: [AutofillHints.email],
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff2f2e3f),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black38),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Password",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ]),
            height: 60,
            child: TextField(
              onChanged: (value) {
                controller.password = value;
              },
              controller: controller.passwordController,
              obscureText: true,
              style: TextStyle(color: Colors.black87),
              autofillHints: [AutofillHints.password],
              onEditingComplete: () => TextInput.finishAutofillContext(),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xff2f2e3f),
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildForgetPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {
          Get.snackbar("Soon", "It will be avilable soon",
              colorText: Colors.white, backgroundColor: primaryColor);
        },
        padding: EdgeInsets.only(right: 0),
        child: Text(
          "Forget Password ?",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () {
          _formkey.currentState!.save();
          if (_formkey.currentState!.validate()) {
            controller.signInWithEmailAndPassword();
          }
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        child: Text(
          "LOGIN",
          style: TextStyle(
              color: Color(0xff2f2e3f),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return GestureDetector(
      onTap: () {
        Get.to(RegisterScreen());
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: 'Don\'t have an Account ?',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: 'Sigh Up',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }

  Widget _oldBody() {
    return Builder(builder: (context) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      title: "Welcome",
                      fontSize: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterScreen());
                      },
                      child: CustomText(
                        title: "Sign Up",
                        color: primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1 - 60,
                ),
                CustomText(
                  title: "Sign in to continue",
                  color: Colors.grey,
                  fontSize: 14,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1 - 40,
                ),
                CustomTextFormField(
                  title: 'Email',
                  hint: "somome@example.com",
                  onSave: (value) {
                    controller.email = value;
                  },
                  validator: (value) {},
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1 - 40,
                ),
                CustomTextFormField(
                  obscureText: true,
                  title: 'Password',
                  hint: "******",
                  onSave: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1 - 50,
                ),
                CustomText(
                  title: "Forgot Password ?",
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1 - 40,
                ),
                CustomButton(
                  onPressed: () {
                    _formkey.currentState!.save();
                    if (_formkey.currentState!.validate()) {
                      controller.signInWithEmailAndPassword();
                    }
                  },
                  title: "Sign in",
                ),

                /* CustomText(
                      title: "-OR-",
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1 - 40,
                    ),
                    CustomButtonSocial(
                        title: 'Google',
                        img: "googleLogo.jpg",
                        onpressed: () {
                          controller.googleSignInMethod();
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1 - 40,
                    ),
                     CustomButtonSocial(
                        title: 'Facebook',
                        img: "facebookLogo.png",
                        onpressed: () {
                          controller.facebookSignInMethod();
                        }),*/
              ],
            ),
          ),
        ),
      );
    });
  }
}
