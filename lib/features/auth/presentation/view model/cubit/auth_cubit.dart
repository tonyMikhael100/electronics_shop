import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:electronics_shop/core/errors/failure.dart';
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
  String userEmail = '';
  Future<void> signUp({required UserModel userModel}) async {
    emit(AuthLoadingState());
    var respnose = await _authRepoImp.signUp(userModel: userModel);
    respnose.fold((l) {
      emit(AuthFailureState(
        errorMessage: l.errorMessage,
      ));
    }, (r) async {
      emit(AuthSuccessState(
          successMessage:
              'Sign up successfully')); // This will be localized in the UI
    });
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(LoginLoadingState());
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
    try {
      final SupabaseService supabaseService = SupabaseService();
      var response = await supabaseService.getUserData(
          email: FirebaseAuth.instance.currentUser!.email!);
      return response;
    } on SocketException {
      emit(AuthFailureState(errorMessage: 'No Internet Connection'));
    }
  }

  Future<dynamic> getUserName() async {
    try {
      var res = await getUserData();
      userName = res[0]['name'];
    } on SocketException {
      emit(AuthFailureState(errorMessage: 'No Internet Connection'));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailureState(
          errorMessage:
              FirebaseFailure.fromFirebaseAuthException(e).toString()));
    } catch (e) {
      emit(AuthFailureState(errorMessage: e.toString()));
    }
  }

  Future<dynamic> getUserEmail() async {
    try {
      var res = await getUserData();
      userEmail = res[0]['email'];
    } on SocketException {
      emit(AuthFailureState(errorMessage: 'No Internet Connection'));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailureState(
          errorMessage:
              FirebaseFailure.fromFirebaseAuthException(e).toString()));
    } catch (e) {
      emit(AuthFailureState(errorMessage: e.toString()));
    }
  }

  Future<dynamic> getUserId() async {
    try {
      var res = await getUserData();
      userId = res[0]['id'];
    } on SocketException {
      emit(AuthFailureState(errorMessage: 'No Internet Connection'));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailureState(
          errorMessage:
              FirebaseFailure.fromFirebaseAuthException(e).toString()));
    } catch (e) {
      emit(AuthFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    emit(SignOutState());
  }

  Future<void> deleteUser() async {
    emit(DelteteUserLoadingState());
    try {
      await FirebaseAuth.instance.currentUser!.delete();
      await SupabaseService().deleteUser(userId: userId);
      emit(DelteteUserSuccessState());
    } catch (e) {
      emit(DelteteUserFailureState(errorMessage: e.toString()));
    }
  }
}
