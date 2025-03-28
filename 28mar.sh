#!/bin/bash
# This script creates the directory structure for each Book folder within text_image_tractor.
# It creates subdirectories for various processing steps as described.

# Check if the text_image_tractor directory exists
if [ ! -d "text_image_tractor" ]; then
  echo "Error: Directory 'text_image_tractor' does not exist in the current path."
  exit 1
fi

# Iterate over each Book subdirectory in text_image_tractor
for book in text_image_tractor/*/; do
  # Extract book folder name (removes trailing slash)
  bookName=$(basename "$book")
  echo "Processing book: $bookName"
  
  # 1. Preliminary Setup
  mkdir -p "$book/1_Preliminary_Setup/Environment_Verification"
  mkdir -p "$book/1_Preliminary_Setup/Folder_Structure_Verification"
  mkdir -p "$book/1_Preliminary_Setup/Inventory"
  
  # 2. Data Cleaning & Validation
  mkdir -p "$book/2_Data_Cleaning_Validation/A_Check_Corrupt_Images"
  mkdir -p "$book/2_Data_Cleaning_Validation/B_Remove_Low_Quality_Blank_Images"
  mkdir -p "$book/2_Data_Cleaning_Validation/C_Verify_Cropped_Images"
  mkdir -p "$book/2_Data_Cleaning_Validation/D_Duplicate_Detection"
  
  # 3. Image-Level Analysis
  mkdir -p "$book/3_Image_Level_Analysis/A_Dimension_Aspect_Ratio_Check"
  mkdir -p "$book/3_Image_Level_Analysis/B_Brightness_Contrast_Analysis"
  mkdir -p "$book/3_Image_Level_Analysis/C_Sharpness_Noise_Analysis"
  
  # 4. Text Content Cleaning
  mkdir -p "$book/4_Text_Content_Cleaning/A_Filter_Unwanted_Characters_OCR"
  mkdir -p "$book/4_Text_Content_Cleaning/B_Case_Normalization"
  
  # 5. Exploratory Data Analysis (EDA)
  mkdir -p "$book/5_Exploratory_Data_Analysis/A_Image_Counts_Visualization"
  mkdir -p "$book/5_Exploratory_Data_Analysis/B_Statistical_Analysis"
  mkdir -p "$book/5_Exploratory_Data_Analysis/C_Summary_Statistics_Generation"
  
  # 6. Merge & Save Processed Data
  mkdir -p "$book/6_Merge_Save_Processed_Data/Copy_Accepted_Images"
  mkdir -p "$book/6_Merge_Save_Processed_Data/Compile_Key_Metrics"
  
  # 7. Final Review & Documentation
  mkdir -p "$book/7_Final_Review_Documentation/A_Summarize_Findings"
  mkdir -p "$book/7_Final_Review_Documentation/B_Next_Steps_Plan"
  
  # Additionally, create a new folder for accepted images in the same parent directory as the book.
  mkdir -p "text_image_tractor/New_$bookName"
  
  echo "Structure created for: $bookName"
done

echo "All directories have been created successfully."
