import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../design_system/spacing.dart';
import 'recipe_detail_page.dart';
import 'add_recipe_page.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String category;
  final String duration;

  const RecipeCard({
    super.key,
    required this.title,
    required this.category,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.s12),
      padding: const EdgeInsets.all(AppSpacing.s12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: AppSpacing.s12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyle.body),
                const SizedBox(height: 4),
                Text('$category • $duration',
                    style: AppTextStyle.caption),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeListPage extends StatefulWidget {
  const RecipeListPage({super.key});

  @override
  State<RecipeListPage> createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  String selectedCategory = 'Semua';

  final categories = [
    'Semua',
    'Sarapan',
    'Makan Siang',
    'Makan Malam',
    'Dessert',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.s16),
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
                  Expanded(
                    child: Text('Daftar Resep', style: AppTextStyle.section),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AddRecipePage(),
                        ),
                      );
                    },
                    child: Text('Tambah'),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.s12),

              // SEARCH
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari resep atau bahan...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: AppColors.surface,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                ),
              ),

              const SizedBox(height: AppSpacing.s12),

              // FILTER CHIP
              SizedBox(
                height: 36,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: AppSpacing.s8),
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    final isActive = selectedCategory == cat;

                    return ChoiceChip(
                      label: Text(cat),
                      selected: isActive,
                      onSelected: (_) {
                        setState(() => selectedCategory = cat);
                      },
                      selectedColor: AppColors.primary,
                      labelStyle: TextStyle(
                        color: isActive ? Colors.white : AppColors.text,
                      ),
                      backgroundColor: AppColors.surface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: AppColors.border),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: AppSpacing.s16),

              // LIST RESEP
              Expanded(
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RecipeDetailPage(),
                          ),
                        );
                      },
                      child: const RecipeCard(
                        title: 'Pho Rebus',
                        category: 'Sarapan',
                        duration: '20 Menit',
                      ),
                    ),

                    const RecipeCard(
                      title: 'Ayam Goreng',
                      category: 'Makan Malam',
                      duration: '45 Menit',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
