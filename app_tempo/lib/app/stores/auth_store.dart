import 'package:mobx/mobx.dart';
import 'package:app_tempo/services/auth_service.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final AuthService _authService;

  _AuthStore(this._authService);

  @observable
  bool isAuthenticated = false;

  @action
  Future<void> login(String email, String password) async {
    isAuthenticated = await _authService.login(email, password);
  }

  @action
  Future<void> register(String email, String password, String name, String photo) async {
    isAuthenticated = await _authService.register(email, password, name, photo);
  }

  @action
  Future<void> loginWithGoogle() async {
    isAuthenticated = await _authService.loginWithGoogle();
  }
}
