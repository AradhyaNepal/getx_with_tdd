import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/counter/controller/counter_controller.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: const _CounterOutput(),
      floatingActionButton: const _ChangeCounter(),
    );
  }

  @override
  void dispose() {
    Get.delete<CounterController>();
    super.dispose();
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
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
            fontSize: 30,
          ),
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
    CounterController controller = Get.find();
    return Row(
      children: [
        const Spacer(),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.redAccent,
          ),
          child: IconButton(
            onPressed: controller.increment,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 20,),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.purpleAccent,
          ),
          child: IconButton(
            onPressed:  controller.reset,
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 20,),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.greenAccent,
          ),
          child: IconButton(
            onPressed: controller.decrement,
            icon: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
