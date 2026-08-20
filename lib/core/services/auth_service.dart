import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserCredential> registerWithEmail(String email, String password) {
    return _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> loginWithEmail(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> loginWithGoogle() async {
    final googleSignIn = GoogleSignIn.instance;
    await googleSignIn.initialize();

    final GoogleSignInAccount account = await googleSignIn.authenticate();
    final GoogleSignInAuthentication auth = account.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: auth.idToken,
    );

    return _auth.signInWithCredential(credential);
  }

  Future<void> logout() async {
    await GoogleSignIn.instance.signOut();
    await _auth.signOut();
  }
}