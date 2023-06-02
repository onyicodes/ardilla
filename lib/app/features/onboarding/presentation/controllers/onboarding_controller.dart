import 'package:ardilla/app/features/onboarding/domain/entities/onboarding_content_entity.dart';
import 'package:ardilla/app/routes/app_pages.dart';

import 'package:ardilla/core/constants/assets_constants.dart';
import 'package:ardilla/core/constants/keys/cache_keys.dart';
import 'package:get/get.dart' hide Trans;
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  final GetStorage storeBox;

  OnboardingController({required this.storeBox});

  final _accountType = ''.obs;
  final _page = 0.obs;
  final _contentList = <OnboardContentEntity>[].obs;

  get accountType => _accountType.value;
  int get page => _page.value;
  List<OnboardContentEntity> get contentList => _contentList;

  set contentList(value) => _contentList.value = value;
  set accountType(value) => _accountType.value = value;
  set page(value) => _page.value = value;

  late String lastUserId;

  @override
  void onInit() {
    super.onInit();

    getBuyerContent();
  }

  getBuyerContent() async {
    contentList.addAll(const [
      OnboardContentEntity(
          title: "Lorem Ipsum Kip Antares Lorem",
          subtitle:
              "Lorem ipsum dolor sit amet consectetur. Colutpat in viverra. Amet integer urna ornare congue ultrices at.",
          imageUrl: AssetsConstants.onboardingImageSvg),
      OnboardContentEntity(
          title: "Antares Lorem Lorem Ipsum Kip ",
          subtitle:
              " Congue eget aliquet nullam velit volutpat in viverra. Amet integer urna ornare congue ultrices at.",
          imageUrl: AssetsConstants.onboardingImageSvg),
      OnboardContentEntity(
          title: "Lorem Ipsum Lorem",
          subtitle:
              "Lorem ipsum dolor sit amet consectetur. Congue eget aliquet nullam velit volutpat in viverra.",
          imageUrl: AssetsConstants.onboardingImageSvg),
    ]);
  }

  toSigninPage() async {
    await storeBox.write(CacheKeys.hasOnboarded, true);

    Get.offAndToNamed(Routes.auth);
  }
}
