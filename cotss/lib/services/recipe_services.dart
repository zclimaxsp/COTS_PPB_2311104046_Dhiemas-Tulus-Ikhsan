import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/supabase_config.dart';
import '../models/recipe_model.dart';

class RecipeService {
  final headers = {
    'apikey': SupabaseConfig.anonKey,
    'Authorization': 'Bearer ${SupabaseConfig.anonKey}',
    'Content-Type': 'application/json',
  };

  // GET ALL RECIPES
  Future<List<Recipe>> getRecipes() async {
    final response = await http.get(
      Uri.parse(
        '${SupabaseConfig.baseUrl}/rest/v1/recipes?select=*',
      ),
      headers: headers,
    );

    final List data = jsonDecode(response.body);
    return data.map((e) => Recipe.fromJson(e)).toList();
  }

  // POST ADD RECIPE
  Future<void> addRecipe(Recipe recipe) async {
    await http.post(
      Uri.parse(
        '${SupabaseConfig.baseUrl}/rest/v1/recipes',
      ),
      headers: {
        ...headers,
        'Prefer': 'return=representation',
      },
      body: jsonEncode(recipe.toJson()),
    );
  }

  // PATCH UPDATE NOTE
  Future<void> updateNote(int id, String note) async {
    await http.patch(
      Uri.parse(
        '${SupabaseConfig.baseUrl}/rest/v1/recipes?id=eq.$id',
      ),
      headers: {
        ...headers,
        'Prefer': 'return=representation',
      },
      body: jsonEncode({'note': note}),
    );
  }
}