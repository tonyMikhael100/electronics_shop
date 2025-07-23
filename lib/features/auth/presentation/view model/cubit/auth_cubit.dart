import 'package:bloc/bloc.dart';
import 'package:electronics_shop/core/services/supabase_service.dart';
import 'package:electronics_shop/features/auth/data/models/user_model.dart';
import 'package:electronics_shop/features/auth/data/repo/auth_repo_imp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthRepoImp _authRepoImp = AuthRepoImp();
  String userName = '';
  String userId = '';

  Future<void> signUp({required UserModel userModel}) async {
    var respnose = await _authRepoImp.signUp(userModel: userModel);
    respnose.fold((l) {
      emit(AuthFailureState(
        errorMessage: l.errorMessage,
      ));
    }, (r) async {
      emit(AuthSuccessState(successMessage: 'Sign up successfully'));
    });
  }

  Future<void> signIn({required String email, required String password}) async {
    var respnose = await _authRepoImp.signIn(email: email, password: password);
    respnose.fold((l) {
      emit(
        LoginFailuregState(
          errorMessage: l.errorMessage,
        ),
      );
    }, (r) {
      emit(LoginSuccessState());
    });
  }

  Future<dynamic> getUserData() async {
    final SupabaseService supabaseService = SupabaseService();
    var response = await supabaseService.getUserData(
        email: FirebaseAuth.instance.currentUser!.email!);
    return response;
  }

  Future<dynamic> getUserName() async {
    var res = await getUserData();
    userName = res[0]['name'];
  }

  Future<dynamic> getUserId() async {
    var res = await getUserData();
    userId = res[0]['id'];
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    emit(SignOutState());
  }
}
