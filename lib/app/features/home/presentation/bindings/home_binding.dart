import 'package:ardilla/app/features/home/data/datasources/home_dataprovider.dart';
import 'package:ardilla/app/features/home/data/repository/home_repository_impl.dart';
import 'package:ardilla/app/features/home/domain/repositories/home_repository.dart';
import 'package:ardilla/app/features/home/domain/usecases/fetch_carousel_usecase.dart';
import 'package:ardilla/app/features/home/domain/usecases/fetch_categories_usecase.dart';
import 'package:ardilla/app/features/home/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';

final homeControllerSl = GetInstance();

class HomeBinding implements Bindings {
  @override
  void dependencies() {
   homeControllerSl.lazyPut<HomeController>(() => HomeController(fetchCarouselUsecase: homeControllerSl(),  fetchCategoriesUsecase: homeControllerSl()));
   
  homeControllerSl.lazyPut<FetchCategoriesUsecase>(
        () =>FetchCategoriesUsecase(repository: homeControllerSl()));

  homeControllerSl.lazyPut<FetchCarouselUsecase>(
        () =>FetchCarouselUsecase(repository: homeControllerSl()));

   homeControllerSl.lazyPut<HomeRepository>(
        () =>HomeRepositoryImpl(dataProvider: homeControllerSl()));

    homeControllerSl.lazyPut<HomeDataProvider>(() => HomeDataProviderImpl());
  }
  
}
