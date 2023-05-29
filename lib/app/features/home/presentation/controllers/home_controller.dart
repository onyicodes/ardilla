import 'package:ardilla/app/features/home/data/model/product_model.dart';
import 'package:ardilla/app/features/home/domain/entities/carousel_entity.dart';
import 'package:ardilla/app/features/home/domain/entities/category_entity.dart';
import 'package:ardilla/app/features/home/domain/usecases/fetch_carousel_usecase.dart';
import 'package:ardilla/app/features/home/domain/usecases/fetch_categories_usecase.dart';
import 'package:ardilla/app/features/landing/presentation/controllers/landing_controller.dart';
import 'package:ardilla/core/constants/general_constants.dart';
import 'package:ardilla/core/general_widgets/custom_snackbar.dart';
import 'package:ardilla/core/parameters/no_params.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FetchCarouselUsecase fetchCarouselUsecase;
  final FetchCategoriesUsecase fetchCategoriesUsecase;
  HomeController(
      {required this.fetchCarouselUsecase,
      required this.fetchCategoriesUsecase});

  final landingController = Get.find<LandingController>();

  final _carousels = <CarouselEntity>[].obs;
  final _categories = <CategoryEntity>[].obs;
  final _productModelList = <ProductModel>[].obs;
  final _favouriteProductModelList = <ProductModel>[].obs;
  final _currentCarouselIndex = 0.obs;
  final _carouselRequestStatus = RequestStatus.initial.obs;
  final _productsRequestStatus = RequestStatus.initial.obs;
  final _categoriesRequestStatus = RequestStatus.initial.obs;
  final _appBarExpanded = true.obs;
  final _currentExchangeTab = 1.obs;
  final _hideBalance = false.obs;

  List<CarouselEntity> get carouselsList => _carousels;
  List<CategoryEntity> get categoriesList => _categories;
  List<ProductModel> get productModelList => _productModelList;
  List<ProductModel> get favouriteProductModelList =>
      _favouriteProductModelList;
  RequestStatus get carouselRequestStatus => _carouselRequestStatus.value;
  RequestStatus get categoriesRequestStatus => _categoriesRequestStatus.value;
  RequestStatus get productsRequestStatus => _productsRequestStatus.value;
  int get currentCarouselIndex => _currentCarouselIndex.value;
  bool get appBarExpanded => _appBarExpanded.value;
  int get currentExchangeTab => _currentExchangeTab.value;
  bool get hideBalance => _hideBalance.value;

  set carouselsList(value) => _carousels.value = value;
  set categoriesList(value) => _categories.value = value;
  set productModelList(value) => _productModelList.value = value;
  set favouriteProductModelList(value) =>
      _favouriteProductModelList.value = value;
  set carouselRequestStatus(value) => _carouselRequestStatus.value = value;
  set categoriesRequestStatus(value) => _categoriesRequestStatus.value = value;
  set productsRequestStatus(value) => _productsRequestStatus.value = value;
  set currentCarouselIndex(value) => _currentCarouselIndex.value = value;
  set appBarExpanded(value) => _appBarExpanded.value = value;
  set currentExchangeTab(value) => _currentExchangeTab.value = value;
  set hideBalance(value) => _hideBalance.value = value;

  @override
  onInit() {
    super.onInit();
    fetchCarousel();
    fetchCategories();
  }

  fetchCategories() async {
    categoriesRequestStatus = RequestStatus.loading;
    final failOrFetch = await fetchCategoriesUsecase(NoParams());
    failOrFetch.fold((l) {
      categoriesRequestStatus = RequestStatus.error;
    }, (r) {
      categoriesList = r;
      categoriesRequestStatus = RequestStatus.success;
    });
  }

  fetchCarousel() async {
    carouselRequestStatus = RequestStatus.loading;
    final failOrFetch = await fetchCarouselUsecase(NoParams());
    failOrFetch.fold((l) {
      customSnackbar(title: "Error", message: "");
      carouselRequestStatus = RequestStatus.error;
    }, (r) async {
      customSnackbar(title: "Success", message: "fetched");
      carouselsList = r;

      carouselRequestStatus = RequestStatus.success;
    });
  }

  changeExchangeTab(int index) {
    currentExchangeTab = index;
  }

  toggleMenu() {
    landingController.toggleMenu();
  }
}
