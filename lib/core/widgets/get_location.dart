// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
//
// import '../../features/cart/presentation/cubit/address/address_cubit.dart';
//
// Future<void> getLocation(AddressCubit viewModel) async {
//   try {
//     // جلب الموقع الحالي من المتصفح (للويب)
//     Position position = await GeolocatorPlatform.instance.getCurrentPosition(
//       locationSettings: const LocationSettings(
//         accuracy: LocationAccuracy.high,
//       ),
//     );
//
//     // تعبئة الإحداثيات في الكونترولر
//     viewModel.latController.text = position.latitude.toString();
//     viewModel.longController.text = position.longitude.toString();
//
//     print("📍 Web Location: ${position.latitude}, ${position.longitude} , ");
//
//     // تحويل الإحداثيات إلى اسم مكان
//     List<Placemark> placemarks = await placemarkFromCoordinates(
//       position.latitude,
//       position.longitude,
//     );
//
//     if (placemarks.isNotEmpty) {
//       final place = placemarks.first;
//
//       // تعبئة بيانات العنوان (يمكنك تعديل الحقول حسب الموجود في AddressCubit)
//       viewModel.streetController.text = place.street ?? '';
//       viewModel.cityController.text = place.locality ?? '';
//       // viewModel..text = place.country ?? '';
//       // viewModel.postalCodeController.text = place.postalCode ?? '';
//
//       print('📌 Address: ${place.street}, ${place.locality}, ${place.country}, ${place.postalCode}');
//     } else {
//       print('❗ لم يتم العثور على عنوان.');
//     }
//
//   } catch (e) {
//     print("❗ Error getting location on Web: $e");
//   }
// }
