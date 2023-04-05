#Install blast+ package
#download CDD database
#download preformateted cog database
#https://ftp.ncbi.nlm.nih.gov/pub/mmdb/cdd/README
#https://ftp.ncbi.nih.gov/pub/mmdb/cdd/little_endian/

wget https://ftp.ncbi.nih.gov/pub/mmdb/cdd/little_endian/Cog_LE.tar.gz
gunzip -d Cog_LE.tar.gz
tar xvpf Cog_LE.tar

#put all protein coding genes files (amino acids) in one directory
#run the rpsblast_opt.sh  script using for loop for all files
#rps results of all files will be stored in defined directory with output file names as genome ids
#run edit_out_files.sh script to tag all proteins in each genome with genome id. (for later use: to seperate the groups)
# concatenate all rps_output files into one file using command
cat *.tsv >> Conc_RPS_results.tsv done

#use the newfilename.tsv and run the script cdd2cog.sh which assigns cdd ids to COGS
#make sure all the database files are present in the same directory. Try to download the updated database.

#use new file in R for tests
  