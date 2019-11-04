import 'package:firebase_auth/firebase_auth.dart';
import 'package:bikehappy/models/user.dart';

class AuthService{
  
  final FirebaseAuth _auth =FirebaseAuth.instance;

  // objeto creado basado de firebase

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid):null;
  }


  //aun no ccaho para que es el stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }

  //inicio anonimo
  Future signInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null; 
    }
  }

  //inicio con correo y contraseña

  //registrar

  //salir
Future signOut()async{
  try {
    return await _auth.signOut();
  } catch (e) {
    print(e.toString());
    return null;
  }
}

}