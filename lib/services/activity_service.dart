import 'package:supabase_flutter/supabase_flutter.dart';

class ActivityService {

  final supabase = Supabase.instance.client;

  // READ
  Future<List<Map<String, dynamic>>> getActivities() async {

    final user = supabase.auth.currentUser;

    if (user == null) return [];

    final response = await supabase
        .from('activities')
        .select()
        .eq('user_id', user.id)
        .order('date', ascending: false);

    return List<Map<String, dynamic>>.from(response);
  }

  // CREATE
 Future<void> addActivity(Map<String, dynamic> data) async {
  final supabase = Supabase.instance.client;

  final user = supabase.auth.currentUser;
  if (user == null) {
    throw Exception("User belum login");
  }

  data['user_id'] = user.id;

  try {
    final res = await supabase
        .from('activities')
        .insert(data)
        .select();   // agar Supabase mengembalikan respons

    print("INSERT OK: $res");
  } catch (e) {
    print("SUPABASE ERROR: $e");
    rethrow;
  }
}

  // UPDATE
  Future<void> updateActivity(String id, Map<String, dynamic> data) async {

    await supabase
        .from('activities')
        .update(data)
        .eq('id', id);
  }

  // DELETE
  Future<void> deleteActivity(String id) async {

    await supabase
        .from('activities')
        .delete()
        .eq('id', id);
  }
}