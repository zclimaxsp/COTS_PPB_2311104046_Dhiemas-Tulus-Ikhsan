import '../models/recipe_model.dart';
import '../services/recipe_services.dart';

class RecipeController {
  final RecipeService _service = RecipeService();

  Future<List<Recipe>> fetchRecipes() {
    return _service.getRecipes();
  }

  Future<void> addNewRecipe(Recipe recipe) {
    return _service.addRecipe(recipe);
  }

  Future<void> updateRecipeNote(int id, String note) {
    return _service.updateNote(id, note);
  }
}
