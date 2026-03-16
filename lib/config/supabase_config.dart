import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const supabaseUrl = 'https://bwoftxdrmemgfhqurymd.supabase.co';
  static const supabaseKey = 'sb_publishable_QdOtVB2AkSbzeJkHgoecAw_wGyJfeaW';

  static Future<void> init() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseKey,
    );
  }
}