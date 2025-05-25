part of 'order_details_cubit.dart';

@immutable
sealed class OrderDetailsState {}

final class OrderDetailsInitial extends OrderDetailsState {}
final class OrderDetailsLoading extends OrderDetailsState {}
final class OrderDetailsSuccess extends OrderDetailsState {
  final OrderDetailsEntity? orderDetailsEntity;

  OrderDetailsSuccess(this.orderDetailsEntity);
}
final class OrderDetailsFailure extends OrderDetailsState {
  final Exception exception;

  OrderDetailsFailure(this.exception);
}
