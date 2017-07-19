#PATH1=/drives/c/Users/User01/Desktop/WMR/wmr-api-2996e0426c-reports_with_dwh_r10/53Reports

find . -type f -exec grep -oiHFf ../table_non_existing.txt {} + > ../out.txt
cd ..
awk '!seen[$0]++' out.txt > file1.txt #only one occourence is shown
rm -f out.txt
