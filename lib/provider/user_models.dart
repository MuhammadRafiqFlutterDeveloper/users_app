import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../resorces/auth_method.dart';

class FavoriteProvider with ChangeNotifier {
  User _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
  List<String> _words = [];
  List<String> get words => _words;

  void toggleFavorite(String words) {
    final isExist = _words.contains(words);
    if (isExist) {
      _words.remove(words);
    } else {
      _words.add(words);
    }
    notifyListeners();
  }

  bool isExist(String word) {
    final isExist = _words.contains(word);
    return isExist;
  }

  void clearFavorite() {
    _words = [];
    notifyListeners();
  }

  static FavoriteProvider of(
      BuildContext context, {
        bool listen = true,
      }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}