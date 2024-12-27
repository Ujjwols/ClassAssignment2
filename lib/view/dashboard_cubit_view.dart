import 'package:class_assignment_two/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubitView extends StatelessWidget {
  const DashboardCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardCubit = context.read<DashboardCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Classwork Assignment Two Ujjwol'),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDashboardButton(
              context: context,
              title: 'Circle Area Calculator',
              icon: Icons.circle_outlined,
              color: Colors.blue,
              onPressed: () => dashboardCubit.openCircleareaView(context),
            ),
            const SizedBox(height: 16),
            _buildDashboardButton(
              context: context,
              title: 'Arithmetic Operations',
              icon: Icons.calculate,
              color: Colors.blue,
              onPressed: () => dashboardCubit.openArthimeticView(context),
            ),
            const SizedBox(height: 16),
            _buildDashboardButton(
              context: context,
              title: 'Simple Interest Calculator',
              icon: Icons.attach_money,
              color: Colors.blue,
              onPressed: () => dashboardCubit.openSimpleinterestView(context),
            ),
            const SizedBox(height: 16),
            _buildDashboardButton(
              context: context,
              title: 'Temperature Converter',
              icon: Icons.thermostat,
              color: Colors.blue,
              onPressed: () => dashboardCubit.openTempertaureView(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardButton({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, size: 32, color: Colors.white),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
