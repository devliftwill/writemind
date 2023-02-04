import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class WritemindFirebaseUser {
  WritemindFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

WritemindFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<WritemindFirebaseUser> writemindFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<WritemindFirebaseUser>(
      (user) {
        currentUser = WritemindFirebaseUser(user);
        return currentUser!;
      },
    );
