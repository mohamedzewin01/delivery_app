


String translateOrderStatus(String status) {
  const Map<String, String> statusTranslations = {
    'Pending': 'قيد الانتظار',
    'Order Accepted': 'تم قبول الطلب',
    'Preparing': 'جاري التجهيز',
    'Out for Delivery': 'في طريقه للتسليم',
    'Delivered': 'تم التوصيل',
  };

  return statusTranslations[status] ?? status;
}
