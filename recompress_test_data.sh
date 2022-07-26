# # # Distribution Statement A. Approved for public release. Distribution unlimited.
# # # 
# # # Author:
# # # Naval Research Laboratory, Marine Meteorology Division
# # # 
# # # This program is free software:
# # # you can redistribute it and/or modify it under the terms
# # # of the NRLMMD License included with this program.
# # # 
# # # If you did not receive the license, see
# # # https://github.com/U-S-NRL-Marine-Meteorology-Division/
# # # for more information.
# # # 
# # # This program is distributed WITHOUT ANY WARRANTY;
# # # without even the implied warranty of MERCHANTABILITY
# # # or FITNESS FOR A PARTICULAR PURPOSE.
# # # See the included license for more details.

#!/bin/bash

geo_data_path=$GEOIPS_BASEDIR/test_data/test_data_amsr2/bg_data/
primary_data_path=$GEOIPS_BASEDIR/test_data/test_data_amsr2/data/

for subdir in ahi_20200518_0740; do
    echo ""
    date -u
    data_path=$geo_data_path/$subdir
    if ls $data_path/*.DAT >& /dev/null; then
        echo "bzip2 $data_path/*.DAT"
        bzip2 -f $data_path/*.DAT
    fi
    date -u
    if [[ ! -e $data_path.tgz ]]; then
        echo "cd $geo_data_path; tar -czf $data_path.tgz $subdir --remove-files"
        cd $geo_data_path; tar -czf $data_path.tgz $subdir --remove-files
    fi
    date -u
done

# Ensure data files are gzipped
    date -u
    if ls $primary_data_path/*.nc >& /dev/null; then
        echo "gzip $primary_data_path/*.nc"
        gzip -f $primary_data_path/*.nc
    fi
