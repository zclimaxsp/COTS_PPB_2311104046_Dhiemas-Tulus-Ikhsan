import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../design_system/spacing.dart';

import 'recipe_list_page.dart';
import 'recipe_detail_page.dart';
import 'add_recipe_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

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
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Resep Masakan', style: AppTextStyle.title),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RecipeListPage(),
                        ),
                      );
                    },
                    child: Text('Daftar Resep', style: AppTextStyle.body),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.s16),

              // Statistik
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: AppSpacing.s12,
                mainAxisSpacing: AppSpacing.s12,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _statCard('Total Resep', '15'),
                  _statCard('Sarapan', '8'),
                  _statCard('Makan Siang & Malam', '12'),
                  _statCard('Dessert', '3'),
                ],
              ),

              const SizedBox(height: AppSpacing.s16),

              Text('Resep Terbaru', style: AppTextStyle.section),
              const SizedBox(height: AppSpacing.s8),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RecipeDetailPage(),
                    ),
                  );
                },
                child: _recipeItem('Pho Rebus', 'Sarapan', '20 Menit'),
              ),
              _recipeItem('Ayam Goreng', 'Makan Malam', '45 Menit'),
              _recipeItem('Puding Strowberi', 'Dessert', '30 Menit'),

              const Spacer(),

              // Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AddRecipePage(),
                      ),
                    );
                  },
                  child: Text('Tambah Resep Baru', style: AppTextStyle.button),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.s12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyle.caption),
          const SizedBox(height: 4),
          Text(value, style: AppTextStyle.title),
        ],
      ),
    );
  }

  Widget _recipeItem(String title, String category, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.s8),
      padding: const EdgeInsets.all(AppSpacing.s12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
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
                Text('$category • $time', style: AppTextStyle.caption),
              ],
            ),
          ),
        ],
      ),
    );
  }
}