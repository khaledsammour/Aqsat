import 'package:aqsat/constance.dart';
import 'package:aqsat/core/service/firestore_user.dart';
import 'package:aqsat/helper/local_storageData.dart';
import 'package:aqsat/model/user_model.dart';
import 'package:aqsat/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  late String email, password, name, phoneNumber;
  Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;
  final LocalStorageData localStorageData = Get.find();
  TextEditingController? emailController, passwordController;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurrentUserData(_auth.currentUser!.uid);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googelUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googelUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(credential).then((value) {
      saveUser(value);
      Get.offAll(ControlView());
    });
  }

  void facebookSignInMethod() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      await _auth.signInWithCredential(facebookAuthCredential).then((user) {
        saveUser(user);
        Get.offAll(ControlView());
      });
    } catch (e) {
      print("error:" + e.toString());
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        getCurrentUserData(value.user!.uid);
      });
      Get.offAll(ControlView());
    } on FirebaseAuthException catch (e) {
      print(e.code);
      switch (e.code) {
        case "wrong-password":
          {
            Get.snackbar('Wrong Password', "invalid password",
                backgroundColor: primaryColor,
                colorText: Colors.white,
                snackPosition: SnackPosition.TOP);
          }
          break;
        case "user-not-found":
          {
            Get.snackbar('No account', "please SignUp first",
                backgroundColor: primaryColor,
                colorText: Colors.white,
                snackPosition: SnackPosition.TOP);
          }
          break;
        case "invalid-email":
          {
            Get.snackbar('Wrong email', "invalid email",
                backgroundColor: primaryColor,
                colorText: Colors.white,
                snackPosition: SnackPosition.TOP);
          }
          break;
        case "too-many-requests":
          {
            Get.snackbar(
                'Try again later', "you had entered too many wrong password",
                backgroundColor: primaryColor,
                colorText: Colors.white,
                snackPosition: SnackPosition.TOP);
          }
          break;
        default:
          {
            Get.snackbar('Something Wrong', e.toString(),
                backgroundColor: primaryColor,
                colorText: Colors.white,
                snackPosition: SnackPosition.TOP);
          }
          break;
      }
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });

      Get.offAll(ControlView());
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error Create account', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email.toString(),
      name: name,
      phoneNumber: phoneNumber,
      pic: null.toString(),
      type: 'Customer',
    );

    await FireStoreUser().addUserToFireStore(userModel);

    setUser(userModel);
  }

  void getCurrentUserData(String uid) async {
    await FireStoreUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data()!));
    });
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
