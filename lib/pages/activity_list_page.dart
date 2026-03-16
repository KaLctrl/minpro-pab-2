import 'package:flutter/material.dart';
import '../services/activity_service.dart';
import '../widgets/activity_card.dart';
import 'activity_form_page.dart';

class ActivityListPage extends StatefulWidget {
  const ActivityListPage({super.key});

  @override
  State<ActivityListPage> createState() => _ActivityListPageState();
}

class _ActivityListPageState extends State<ActivityListPage> {

  final ActivityService service = ActivityService();
  List activities = [];

  Future loadData() async {
    final data = await service.getActivities();

    setState(() {
      activities = data;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Activity Tracker"),
      ),

      body: activities.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    Icons.assignment_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Belum ada aktivitas",
                    style: TextStyle(fontSize: 18),
                  ),

                  Text(
                    "Tekan tombol + untuk menambah",
                    style: TextStyle(color: Colors.grey),
                  ),

                ],
              ),
            )

          : RefreshIndicator(
              onRefresh: loadData,

              child: ListView.builder(
                itemCount: activities.length,

                itemBuilder: (context, index) {

                  final activity = activities[index];

                  return ActivityCard(
                    activity: activity,

                    onDelete: () async {

                      await service.deleteActivity(activity['id']);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Data berhasil dihapus"),
                        ),
                      );

                      loadData();
                    },

                    onEdit: () async {

                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ActivityFormPage(activity: activity),
                        ),
                      );

                      loadData();
                    },
                  );
                },
              ),
            ),

      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text("Tambah"),
        onPressed: () async {

          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const ActivityFormPage(),
            ),
          );

          loadData();
        },
      ),
    );
  }
}