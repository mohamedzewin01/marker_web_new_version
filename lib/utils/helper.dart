// import 'package:get/get.dart';
//
// import 'package:lottie/lottie.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../constants/appConstantsApi.dart';
// import '../domain/cartViewModel.dart';
// import '../domain/categorieViewModel.dart';
// import '../domain/productViewModel.dart';
// import '../models/product_repo_Impl.dart';
// import '../models/shopingCart_repo_impl.dart';
// import '../models/source/local/cart_local_storage.dart';
// import '../models/source/local/product_local_storage.dart';
// import '../models/source/remote/api.dart';
//
// Future initDependencies() async {
//   final sharedPreferences = await SharedPreferences.getInstance();
//   Get.lazyPut(() => LocalStorageImpl(sharedPreferences: sharedPreferences));
//
//   Get.lazyPut(() => ApiImpl(AppConstantsApi.BASE_URL));
//
//   Get.lazyPut(() => ProductRepositoryImpl(
//         api: Get.find<ApiImpl>(),
//         localStorage: Get.find<LocalStorageImpl>(),
//       ));
//
//   Get.lazyPut(() => ProductViewModel(
//       productRepositoryImpl: Get.find<ProductRepositoryImpl>()));
//
//   Get.lazyPut(() => CartLocalStorageImpl(sharedPreferences: sharedPreferences));
//
//   Get.lazyPut(() => CartRepositoryImpl(
//         cartLocalStorage: Get.find<CartLocalStorageImpl>(),
//       ));
//
//   Get.lazyPut(() => ShoppingCartViewModel(
//       cartRepositoryImpl: Get.find<CartRepositoryImpl>()));
//
//   Get.put(CategorieViewModel());
//
//   //Get.put(SearchViewModel());
//
//   //Get.put(MyGameController());
// }
//
// Future<LottieComposition?> customDecoder(List<int> bytes) {
//   return LottieComposition.decodeZip(bytes, filePicker: (files) {
//     return files.firstWhereOrNull(
//         (f) => f.name.startsWith('animations/') && f.name.endsWith('.json'));
//   });
// }
