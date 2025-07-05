import 'package:bloc/bloc.dart';
import 'package:electronics_shop/features/home/data/models/banner_model.dart';
import 'package:electronics_shop/features/home/data/repo/home_repo_imp.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final HomeRepoImp homeRepoImp = HomeRepoImp();

  void fetchBanners({required String tableName}) async {
    emit(HomeBannerLoadingState());
    var response = await homeRepoImp.fetchBanners(tableName: tableName);
    print(response);
    response.fold((filure) {
      emit(HomeBannerFailureState(errorMessage: 'An error occur'));
    }, (banners) {
      emit(HomeBannerSuccessState(bannerList: banners));
    });
  }
}
