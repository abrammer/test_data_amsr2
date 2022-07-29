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

NRLMMD-GEOIPS/geoips_tutorial#3 - Add git lfs install to README

### Documentation Updates
* Add "git lfs install" to README.md to ensure Git Large File Storage tracked data files are cloned properly


# v1.5.1: 2022-07-13, geoips2->geoips, consolidate test outputs, update compress scripts

### Refactor
* **File modifications**
    * Update all instances of 'geoips2' with 'geoips'
    * Update all instances of 'GEOIPS2' with 'GEOIPS'
* **Test outputs**
    * Remove all test outputs from test data repo (move to source repos)
    * Add bdeck file for reference
    * Update uncompress/recompress test scripts for single tgz background file

### Documentation Updates
* Update \*.md Distro statement headers to use 4 spaces prefix rather than ### (formatting improvement)
* **README.md**
    * Update test scripts to use $GEOIPS simplified direct test calls


# v1.4.4: 2022-03-07, Corrected AHI Visible background for AMSR2 products

### Test Repo Updates
* Updated AMSR2 overlay products to use corrected AHI Visible background (corrected data range and gamma)


# v1.4.2: 2022-02-05, Updated test outputs for v5.0.0 natural earth vector shapefiles

### Test Repo Updates
    * Update natural earth vector shapefiles to v5.0.0, used for cartopy plotting
        * One new political border for AMSR2 passive microwave products over IO01 TC2020


# v1.4.0: 2022-01-12, remove test scripts

### Refactor
    * Remove test scripts directly within test_data_amsr2
        * Keep all test scripts in source repos - reference source repo test scripts in README.md


# v1.3.0: 2021-11-25, atcf->tc, remove satops

### Breaking Test Repo Updates
    * Update TC YAML metadata outputs
        * update output path to geoips_outdirs/preprocessed/tcwww
        * add sector_type: tc


# v1.2.5: 2021-11-18, moved test scripts from geoips to test_data_amsr2

###  Major New Functionality
    * Moved AMSR2 test scripts from geoips/tests to test_data_amsr2/tests
        * amsr2_config.sh
        * amsr2_over_preprocessed.sh
        * amsr2_over_raw.sh


# v1.2.4: 2021-11-12, original_source_filename->original_source_filenames

### Breaking Test Repo Updates
    * Replaced original_source_filename attribute with list of original_source_filenames
        * Updated all metadata YAML outputs


# v1.2.3: 2021-11-05, add "bgVisible" to filename extra field

### Breaking Test Repo Updates
    * Updated product filenames to include "bgVisible" in filename extra field for overlay products
        * Does not impact non-overlay products
        * Imagery itself did not change
    * Modified YAML metadata files with updated product_filename field


# v1.2.2: 2021-10-25, slight changes to title times

### Breaking Test Repo Updates
    * Slight changes to title times due to reducing padding from 2.5x to 1.5x for TC sectors
        * No change to data/image output


# v1.2.1: 2021-10-05, Updated matplotlib/cartopy versions, removed automatic TC recentering for all products

### Breaking Test Repo Updates
    * Updated cartopy to 0.20.0 and matplotlib to v3.4.3
        * test repo outputs incompatible with matplotlib < 3.4.0 and cartopy < 0.19.0
        * Older versions have figures that are very slightly shifted from later versions
        * Exclusively a qualitative difference, but it *does* cause the test comparisons to fail
    * No longer recentering all TC outputs by default
        * standard outputs are *not* recentered as of 1.2.1 - test recentering separately from other functionality


# v1.2.0: Major backwards incompatible update

###  Major New Functionality
    * Exhaustive test scripts with final return value of 0 for successful completion of all functionality
    * Initial geotiff output support
    * Initial full disk output support
    * Night Visible products
    * Recentering / sectoring updates
 
###  Improvements
    * YAML based product specifications (references colormaps, algorithms,
      interpolation routines, coverage checks, etc)
 
###  Bug fixes
    * Resolved sectoring issue, allowing complete center coverage
        * Previously when sectoring based on min/max lat/lon, any values outside the explicit
          requested values would be masked, causing masked data on non-square datasets when 
          good data was actually available for the entire requested region. Only drop rows outside
          requested range, do not mask data.

GEOIPS-71 GEOIPS-6
