class Constants {
  static const baseUrl = "https://api.example.com";
  static const List<String> orderStages = const [
    'Pending',
    'Order Accepted',
    'Preparing',
    'Out for Delivery',
    'Delivered',
  ];
 static   int getCurrentStageIndex(String status) {
    switch (status) {
      case 'Pending':
        return 0;
      case 'Order Accepted':
        return 1;
      case 'Preparing':
        return 2;
      case 'Out for Delivery':
        return 3;
      case 'Delivered':
        return 4;
      default:
        return 0;
    }
  }
 static String getButtonLabel(String status) {
    switch (status) {
      case 'Pending':
        return 'بدء التحضير';
      case 'Order Accepted':
        return 'البدء من التوصيل';
      case 'Preparing':
        return 'جاري التوصيل';
      case 'Out for Delivery':
        return 'تم التوصيل';
      case 'Delivered':
        return 'انهاء';
      default:
        return 'غير معروف';
    }
  }
}
