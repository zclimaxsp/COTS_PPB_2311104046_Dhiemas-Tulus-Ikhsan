import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../design_system/spacing.dart';
import '../../controllers/recipe_controller.dart';
import '../../models/recipe_model.dart';


class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final _formKey = GlobalKey<FormState>();

  String? selectedCategory;

  final titleController = TextEditingController();
  final ingredientsController = TextEditingController();
  final stepsController = TextEditingController();
  final noteController = TextEditingController();

  final categories = [
    'Sarapan',
    'Makan Siang',
    'Makan Malam',
    'Dessert',
  ];

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: AppColors.surface,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.border),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.s16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 4),
                    Text('Tambah Resep', style: AppTextStyle.section),
                  ],
                ),

                const SizedBox(height: AppSpacing.s16),

                // JUDUL
                Text('Judul Resep', style: AppTextStyle.caption),
                const SizedBox(height: 4),
                TextFormField(
                  controller: titleController,
                  decoration: _inputDecoration('Judul Resep'),
                  validator: (value) =>
                      value!.isEmpty ? 'Judul resep wajib diisi' : null,
                ),

                const SizedBox(height: AppSpacing.s12),

                // KATEGORI
                Text('Kategori', style: AppTextStyle.caption),
                const SizedBox(height: 4),
                DropdownButtonFormField<String>(
                  value: selectedCategory,
                  decoration: _inputDecoration('Pilih kategori'),
                  items: categories
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() => selectedCategory = value);
                  },
                  validator: (value) =>
                      value == null ? 'Kategori wajib dipilih' : null,
                ),

                const SizedBox(height: AppSpacing.s12),

                // BAHAN
                Text('Bahan-bahan', style: AppTextStyle.caption),
                const SizedBox(height: 4),
                TextFormField(
                  controller: ingredientsController,
                  decoration: _inputDecoration(
                      'Masukkan bahan, pisahkan dengan koma'),
                  maxLines: 3,
                  validator: (value) =>
                      value!.isEmpty ? 'Bahan wajib diisi' : null,
                ),

                const SizedBox(height: AppSpacing.s12),

                // LANGKAH
                Text('Langkah-langkah', style: AppTextStyle.caption),
                const SizedBox(height: 4),
                TextFormField(
                  controller: stepsController,
                  decoration: _inputDecoration(
                      'Masukkan langkah, pisahkan dengan baris'),
                  maxLines: 3,
                  validator: (value) =>
                      value!.isEmpty ? 'Langkah wajib diisi' : null,
                ),

                const SizedBox(height: AppSpacing.s12),

                // CATATAN
                Text('Catatan', style: AppTextStyle.caption),
                const SizedBox(height: 4),
                TextFormField(
                  controller: noteController,
                  decoration:
                      _inputDecoration('Catatan tambahan (opsional)'),
                  maxLines: 2,
                ),

                const Spacer(),

                // ACTION BUTTON
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: BorderSide(color: AppColors.border),
                          minimumSize: const Size.fromHeight(48),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Batal'),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.s12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size.fromHeight(48),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final controller = RecipeController();

                            final recipe = Recipe(
                              title: titleController.text,
                              category: selectedCategory!,
                              ingredients: ingredientsController.text,
                              steps: stepsController.text,
                              note: noteController.text,
                            );

                            await controller.addNewRecipe(recipe);

                            Navigator.pop(context);
                          }
                        },
                        child:
                            Text('Simpan', style: AppTextStyle.button),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}