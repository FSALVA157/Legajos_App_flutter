import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class AccessScreen extends StatefulWidget {
  AccessScreen({Key? key}) : super(key: key);

  @override
  _AccessScreenState createState() => _AccessScreenState();
}

class _AccessScreenState extends State<AccessScreen> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  String _message = "Not Authorized";

  Future<bool> checkingForBioMetrics() async {
    bool canCheckBiometrics = await _localAuthentication.canCheckBiometrics;
    print(canCheckBiometrics);
    return canCheckBiometrics;
  }

  Future<void> _authenticateMe() async {
// 8. this method opens a dialog for fingerprint authentication.
//    we do not need to create a dialog nut it popsup from device natively.
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason:
            "Autentiquese para Abrir la Aplicación!", // message for dialog
        useErrorDialogs: true, // show error in dialog
        stickyAuth: true, // native process
      );
      // setState(() {
      //   _message = authenticated ? "Autorizado" : "No Autorizado";
      // });
      if (authenticated) {
        Navigator.pushReplacementNamed(context, 'home');
      } else {
        return;
      }
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
  }

  @override
  void initState() {
// TODO: implement initState
    checkingForBioMetrics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FondoWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _authenticateMe();
        },
        child: Icon(Icons.fingerprint),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class FondoWidget extends StatelessWidget {
  const FondoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: alto,
          width: ancho,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/fingerprint_access4.jpg'))),
        )
      ],
    );
  }
}
