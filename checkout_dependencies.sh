#!/bin/sh

#  checkout_dependencies.sh
#  
#
#  Created by Ragunath on 30/01/15.
#
#!/bin/sh

# External Dependency File Path
external_dependency_file_path="External/"

# Navigate To External Directory
cd $external_dependency_file_path

# Tesseract Test Data
tesseract_test_data_file="tesseract-ocr-3.02.eng.tar.gz"
tesseract_test_data_download_url_data="https://tesseract-ocr.googlecode.com/files/tesseract-ocr-3.02.eng.tar.gz"

echo "------------------------------------------------------------"
echo "Download Tesseract Data"
echo "------------------------------------------------------------"
echo "Started Downloding..."
curl -sS $tesseract_test_data_download_url_data > $tesseract_test_data_file
echo "Download Complte..."
echo "Unziping Tesseract Data..."
gunzip -c $tesseract_test_data_file | tar xopf -
echo "Removing Temporary Files..."
rm $tesseract_test_data_file

echo "------------------------------------------------------------"
echo "Started Downloding/Cloning Tesseract Library..."
echo "------------------------------------------------------------"
# Tesseract Library
tesseract_ios_lib_dependency_file_path="External/"
tesseract_ios_lib_git_clone_url="https://github.com/ldiqual/tesseract-ios.git"

# Clone library from git repository
# Checkout happen @tesseract-ios folder
git clone $tesseract_ios_lib_git_clone_url
echo "Downlod Complete For Tesseract Library..."
echo "All Related Files Are Downloaded From Server...:-)"

