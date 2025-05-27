part of 'orders_completed_cubit.dart';

@immutable
sealed class OrdersCompletedState {}

final class OrdersCompletedInitial extends OrdersCompletedState {}
final class OrdersCompletedLoading extends OrdersCompletedState {}
final class OrdersCompletedSuccess extends OrdersCompletedState {
  final OrderCompletedEntity? orderCompletedEntity;

  OrdersCompletedSuccess(this.orderCompletedEntity);
}
final class OrdersCompletedFailure extends OrdersCompletedState {
  final Exception exception;

  OrdersCompletedFailure(this.exception);
}
