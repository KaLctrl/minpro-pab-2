import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {

  final Map activity;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ActivityCard({
    super.key,
    required this.activity,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {

    final date = activity['date'].toString().split('T')[0];

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [

                const Icon(
                  Icons.task_alt,
                  color: Colors.indigo,
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: Text(
                    activity['name'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: onEdit,
                ),

                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: onDelete,
                ),

              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [

                const Icon(Icons.timer, size: 18),

                const SizedBox(width: 5),

                Text("${activity['duration']} menit"),

                const SizedBox(width: 20),

                const Icon(Icons.calendar_today, size: 18),

                const SizedBox(width: 5),

                Text(date),

              ],
            ),

            if (activity['notes'] != null &&
                activity['notes'].toString().isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  activity['notes'],
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}