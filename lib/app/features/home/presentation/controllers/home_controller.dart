import 'package:ardilla/app/features/home/data/model/benefits_model.dart';
import 'package:ardilla/app/features/home/data/model/cash_flow_model.dart';
import 'package:ardilla/app/features/home/data/model/product_model.dart';
import 'package:ardilla/app/features/home/data/model/rank_model.dart';
import 'package:ardilla/app/features/home/domain/entities/carousel_entity.dart';
import 'package:ardilla/app/features/home/domain/entities/category_entity.dart';
import 'package:ardilla/app/features/home/domain/usecases/fetch_benefits_usecase.dart';
import 'package:ardilla/app/features/home/domain/usecases/fetch_carousel_usecase.dart';
import 'package:ardilla/app/features/home/domain/usecases/fetch_cash_flow_usecase.dart';
import 'package:ardilla/app/features/home/domain/usecases/fetch_categories_usecase.dart';
import 'package:ardilla/app/features/home/domain/usecases/fetch_rank_usecase.dart';
import 'package:ardilla/app/features/landing/presentation/controllers/landing_controller.dart';
import 'package:ardilla/core/constants/general_constants.dart';
import 'package:ardilla/core/general_widgets/custom_snackbar.dart';
import 'package:ardilla/core/models/user_model.dart';
import 'package:ardilla/core/parameters/no_params.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FetchCarouselUsecase fetchCarouselUsecase;
  final FetchCategoriesUsecase fetchCategoriesUsecase;
  final FetchCashFlowUsecase fetchCashFlowUsecase;
  final FetchBenefitsUsecase fetchBenefitsUsecase;
  final FetchRanksUsecase fetchRanksUsecase;

  HomeController(
      {required this.fetchCarouselUsecase,
      required this.fetchCashFlowUsecase,
      required this.fetchRanksUsecase,
      required this.fetchBenefitsUsecase,
      required this.fetchCategoriesUsecase});

  final landingController = Get.find<LandingController>();

  final _carousels = <CarouselEntity>[].obs;
  final _categories = <CategoryEntity>[].obs;
  final _productModelList = <ProductModel>[].obs;
  final _favouriteProductModelList = <ProductModel>[].obs;
  final _benefitsModelList = <BenefitsModel>[].obs;
  final _ranksModelList = <RankModel>[].obs;
  final _cashFlowModel = Rxn<CashFlowModel>();
  final _currentCarouselIndex = 0.obs;
  final _carouselRequestStatus = RequestStatus.initial.obs;
  final _benefitsRequestStatus = RequestStatus.initial.obs;
  final _ranksRequestStatus = RequestStatus.initial.obs;
  final _productsRequestStatus = RequestStatus.initial.obs;
  final _categoriesRequestStatus = RequestStatus.initial.obs;
  final _cashFlowRequestStatus = RequestStatus.initial.obs;
  final _appBarExpanded = true.obs;
  final _currentExchangeTab = 1.obs;
  final _hideBalance = false.obs;

  List<CarouselEntity> get carouselsList => _carousels;
  List<BenefitsModel> get benefitsModelList => _benefitsModelList;
  List<RankModel> get ranksModelList => _ranksModelList;
  List<CategoryEntity> get categoriesList => _categories;
  List<ProductModel> get productModelList => _productModelList;
  CashFlowModel? get cashFlowModel => _cashFlowModel.value;
  List<ProductModel> get favouriteProductModelList =>
      _favouriteProductModelList;
  RequestStatus get carouselRequestStatus => _carouselRequestStatus.value;
  RequestStatus get cashFlowRequestStatus => _cashFlowRequestStatus.value;
  RequestStatus get benefitsRequestStatus => _benefitsRequestStatus.value;
  RequestStatus get ranksRequestStatus => _ranksRequestStatus.value;
  RequestStatus get categoriesRequestStatus => _categoriesRequestStatus.value;
  RequestStatus get productsRequestStatus => _productsRequestStatus.value;
  int get currentCarouselIndex => _currentCarouselIndex.value;
  bool get appBarExpanded => _appBarExpanded.value;
  int get currentExchangeTab => _currentExchangeTab.value;
  bool get hideBalance => _hideBalance.value;

  set carouselsList(value) => _carousels.value = value;
  set categoriesList(value) => _categories.value = value;
  set productModelList(value) => _productModelList.value = value;
  set benefitsModelList(value) => _benefitsModelList.value = value;
  set ranksModelList(value) => _ranksModelList.value = value;
  set benefitsRequestStatus(value) => _ranksRequestStatus.value = value;
  set ranksRequestStatus(value) => _benefitsRequestStatus.value = value;
  set cashFlowModel(value) => _cashFlowModel.value = value;
  set favouriteProductModelList(value) =>
      _favouriteProductModelList.value = value;
  set carouselRequestStatus(value) => _carouselRequestStatus.value = value;
  set categoriesRequestStatus(value) => _categoriesRequestStatus.value = value;
  set cashFlowRequestStatus(value) => _cashFlowRequestStatus.value = value;
  set productsRequestStatus(value) => _productsRequestStatus.value = value;
  set currentCarouselIndex(value) => _currentCarouselIndex.value = value;
  set appBarExpanded(value) => _appBarExpanded.value = value;
  set currentExchangeTab(value) => _currentExchangeTab.value = value;
  set hideBalance(value) => _hideBalance.value = value;
  late UserModel usermodel;

  @override
  onInit() {
    super.onInit();
    usermodel = landingController.userModel;
    fetchCarousel();
    fetchCategories();
    fetchCashFlowData();
    fetchBenefits();
    fetchRanks();
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

  fetchCashFlowData() async {
    cashFlowRequestStatus = RequestStatus.loading;
    final failOrFetch = await fetchCashFlowUsecase(NoParams());
    failOrFetch.fold((l) {
      customSnackbar(title: "Error", message: "");
      cashFlowRequestStatus = RequestStatus.error;
    }, (r) async {
      customSnackbar(title: "Success", message: "cash flow fetched");
      cashFlowModel = r;

      cashFlowRequestStatus = RequestStatus.success;
    });
  }

  fetchBenefits() async {
    benefitsRequestStatus = RequestStatus.loading;
    final failOrFetch = await fetchBenefitsUsecase(NoParams());
    failOrFetch.fold((l) {
      customSnackbar(title: "Error", message: "");
      benefitsRequestStatus = RequestStatus.error;
    }, (r) async {
      customSnackbar(title: "Success", message: "cash flow fetched");
      benefitsModelList = r;

      benefitsRequestStatus = RequestStatus.success;
    });
  }

  fetchRanks() async {
    ranksRequestStatus = RequestStatus.loading;
    final failOrFetch = await fetchRanksUsecase(NoParams());
    failOrFetch.fold((l) {
      customSnackbar(title: "Error", message: "");
      ranksRequestStatus = RequestStatus.error;
    }, (r) async {
      customSnackbar(title: "Success", message: "cash flow fetched");
      ranksModelList = r;

      ranksRequestStatus = RequestStatus.success;
    });
  }

  changeExchangeTab(int index) {
    currentExchangeTab = index;
  }

  toggleMenu() {
    landingController.toggleMenu();
  }
}
