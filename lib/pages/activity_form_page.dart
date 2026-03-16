import 'package:flutter/material.dart';
import '../services/activity_service.dart';

class ActivityFormPage extends StatefulWidget {

  final Map? activity;

  const ActivityFormPage({super.key, this.activity});

  @override
  State<ActivityFormPage> createState() => _ActivityFormPageState();
}

class _ActivityFormPageState extends State<ActivityFormPage> {

  final ActivityService service = ActivityService();

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final durationController = TextEditingController();
  final notesController = TextEditingController();

  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();

    if (widget.activity != null) {

      nameController.text = widget.activity!['name'];
      durationController.text = widget.activity!['duration'].toString();
      notesController.text = widget.activity!['notes'] ?? "";

      selectedDate = DateTime.parse(widget.activity!['date']);
    }
  }

  Future save() async {

    if (!_formKey.currentState!.validate()) return;

    final data = {
      "name": nameController.text,
      "duration": int.parse(durationController.text),
      "notes": notesController.text,
      "date": selectedDate.toString(),
    };

    if (widget.activity == null) {

      await service.addActivity(data);

    } else {

      await service.updateActivity(
        widget.activity!['id'],
        data,
      );
    }

    Navigator.pop(context);
  }

  Future pickDate() async {

    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.activity == null
              ? "Tambah Activity"
              : "Edit Activity",
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formKey,

          child: Column(
            children: [

              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Nama Aktivitas",
                ),
                validator: (value) =>
                    value!.isEmpty ? "Harus diisi" : null,
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: durationController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Durasi (menit)",
                ),
                validator: (value) =>
                    value!.isEmpty ? "Harus diisi" : null,
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: notesController,
                decoration: const InputDecoration(
                  labelText: "Catatan",
                ),
              ),

              const SizedBox(height: 16),

              Row(
                children: [

                  Expanded(
                    child: Text(
                      selectedDate == null
                          ? "Pilih tanggal"
                          : selectedDate
                              .toString()
                              .split(" ")[0],
                    ),
                  ),

                  ElevatedButton(
                    onPressed: pickDate,
                    child: const Text("Pilih"),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: save,
                  child: const Text("Simpan"),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}