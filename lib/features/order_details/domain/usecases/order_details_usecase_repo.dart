import 'package:delivery/core/common/api_result.dart';
import 'package:delivery/features/order_details/data/models/request/updata_status_request.dart';
import 'package:delivery/features/order_details/domain/entities/order_details_entities.dart';

abstract class OrderDetailsUseCaseRepo {
  Future<Result<OrderDetailsEntity?>> updateStatus({required int id, required String status});
}
