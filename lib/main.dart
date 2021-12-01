import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_otp/login_choice.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const LoginChoiceScreen();
  }
}




// // ignore_for_file: prefer_function_declarations_over_variables

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:sms_autofill/sms_autofill.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const App());
// }

// class App extends StatelessWidget {
//   const App({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("Login"),
//         ),
//         body: const MyApp(),
//       ),
//     );
//   }
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   var otpController = TextEditingController();
//   var numController = TextEditingController();

//   FirebaseAuth auth = FirebaseAuth.instance;
//   String code = "";
//   String verificationId = "";

//   void signInWithPhoneAuthCredential(
//       PhoneAuthCredential phoneAuthCredential) async {
//     try {
//       final authCredential =
//           await auth.signInWithCredential(phoneAuthCredential);

//       if (authCredential.user != null) {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => const Welcome()));
//       }
//     } on FirebaseAuthException catch (e) {
//       // ignore: avoid_print
//       print("catch $e");
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _listenOtp();
//   }

//   @override
//   void dispose() {
//     SmsAutoFill().unregisterListener();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Flexible(
//                   flex: 3,
//                   child: TextField(
//                     decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Phone Number',
//                         hintText: 'Enter valid number'),
//                     controller: numController,
//                   ),
//                 ),
//                 Flexible(
//                   flex: 1,
//                   child: IconButton(
//                     onPressed: () async {
//                       fetchotp();
//                       final signature = SmsAutoFill().getAppSignature;
//                       print(signature);
//                     },
//                     icon: const Icon(Icons.send),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           PinFieldAutoFill(
//             decoration: UnderlineDecoration(
//               textStyle: const TextStyle(fontSize: 20, color: Colors.black),
//               colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
//             ),
//             currentCode: code,
//             onCodeSubmitted: (code) {},
//             onCodeChanged: (code) {
//               if (code!.length == 6) {
//                 FocusScope.of(context).requestFocus(FocusNode());
//               }
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: TextField(
//               obscureText: true,
//               decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'OTP',
//                   hintText: 'Enter valid OTP'),
//               controller: otpController,
//             ),
//           ),
//           OutlinedButton(
//               onPressed: () {
//                 verify();
//               },
//               child: const Text("Login"))
//         ],
//       ),
//     );
//   }

//   Future<void> verify() async {
//     PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
//         verificationId: verificationId, smsCode: code);

//     signInWithPhoneAuthCredential(phoneAuthCredential);
//   }

//   Future<void> fetchotp() async {
//     final PhoneVerificationCompleted verificationCompleted =
//         (PhoneAuthCredential credential) async {
//       await auth.signInWithCredential(credential);
//     };

//     final PhoneVerificationFailed verificationFailed =
//         (FirebaseAuthException e) {
//       if (e.code == 'invalid-phone-number') {
//         // ignore: avoid_print
//         print('The provided phone number is not valid.');
//       }
//     };

//     final PhoneCodeSent codeSent =
//         (String verificationId, int? resendToken) async {
//       this.verificationId = verificationId;
//     };

//     final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
//         (String verificationId) {
//       verificationId = verificationId;
//     };

//     await auth.verifyPhoneNumber(
//       phoneNumber: '+91${numController.text}',
//       verificationCompleted: verificationCompleted,
//       verificationFailed: verificationFailed,
//       codeSent: codeSent,
//       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
//     );
//   }
// }

// void _listenOtp() async {
//   await SmsAutoFill().listenForCode();
// }

// class Welcome extends StatelessWidget {
//   const Welcome({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Welcome'),
//         ),
//       ),
//     );
//   }
// }
