import 'package:delivery/core/common/api_result.dart';
import 'package:delivery/features/order_details/data/datasources/order_details_datasource_repo.dart';
import 'package:delivery/features/order_details/data/models/request/updata_status_request.dart';
import 'package:delivery/features/order_details/domain/entities/order_details_entities.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/order_details_repository.dart';

@Injectable(as: OrderDetailsRepository)
class OrderDetailsRepositoryImpl implements OrderDetailsRepository {
  final OrderDetailsDatasourceRepo orderDetailsDatasourceRepo;
  OrderDetailsRepositoryImpl(this.orderDetailsDatasourceRepo);
  @override
  Future<Result<OrderDetailsEntity?>> updateStatus(UpdateStatusRequest updateStatusRequest) {
    return orderDetailsDatasourceRepo.updateStatus(updateStatusRequest);

  }
  // implementation
}
