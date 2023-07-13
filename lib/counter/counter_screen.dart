import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/counter/controller/counter_controller.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CounterController());
    return const Scaffold(
      body: _CounterOutput(),
      floatingActionButton: _ChangeCounter(),
    );
  }
}

class _CounterOutput extends StatelessWidget {
  const _CounterOutput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CounterController controller = Get.find();
    return Obx(
      () => Center(
        child: Text(
          controller.count.toString(),
        ),
      ),
    );
  }
}

class _ChangeCounter extends StatelessWidget {
  const _ChangeCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CounterController controller=Get.find();
    return Row(
      children: [
        IconButton(
          onPressed: () {
            controller.increment();
          },
          icon: const Icon(
            Icons.add,
          ),
        ),
        IconButton(
          onPressed: () {
            controller.decrement();
          },
          icon: const Icon(
            Icons.minimize,
          ),
        )
      ],
    );
  }
}
