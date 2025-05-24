
import 'package:delivery/core/di/di.dart';
import 'package:delivery/core/widgets/custom_app_bar.dart';
import 'package:delivery/features/home/data/models/response/get_orders_delivery.dart';
import 'package:delivery/features/home/presentation/cubit/home_cubit.dart';
import 'package:delivery/features/home/presentation/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<HomeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel..getHomeData(),
      child: RefreshIndicator(
        onRefresh: () => viewModel.getHomeData(),
        child: Scaffold(
          body: SafeArea(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeSuccess) {
                  List<Orders> orders =
                      state.homeEntity?.orders?.reversed.toList() ?? [];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 75,
                        child: CustomAppBar(title: 'فضاء الخليج '),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: OrderCard(order: orders[index]),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height:kBottomNavigationBarHeight + 16 ),
                    ],
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}

