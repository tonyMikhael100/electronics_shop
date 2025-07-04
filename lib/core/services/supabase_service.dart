import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;

  // Get all data from any table
  Future<List<Map<String, dynamic>>> getAll({
    required String table,
  }) async {
    final response = await _client.from(table).select('*');
    return response;
  }

  // Insert data into any table
  Future insert({
    required String table,
    required Map<String, dynamic> values,
  }) async {
    final response = await _client.from(table).insert(values);
    return response;
  }

  // Update data in any table
  Future<List<Map<String, dynamic>>> update({
    required String table,
    required Map<String, dynamic> values,
    required String matchColumn,
    required dynamic matchValue,
  }) async {
    final response = await _client
        .from(table)
        .update(values)
        .eq(matchColumn, matchValue)
        .select();
    return response;
  }

  // Delete data from any table
  Future<List<Map<String, dynamic>>> delete({
    required String table,
    required String matchColumn,
    required dynamic matchValue,
  }) async {
    final response =
        await _client.from(table).delete().eq(matchColumn, matchValue).select();
    return response;
  }
}
