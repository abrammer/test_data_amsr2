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

Testing Guide
=============

This testing guide has steps specific to installing and testing geoips for purposes of testing datasets
contained within this test data repository.  This includes installing the base geoips conda environment
if not already installed.


Sample Dataset Sources
-----------------------

* JMA Himawari-8 was accessed on 2021-02-25 from https://registry.opendata.aws/noaa-himawari.
* AMSR2 RSS TC Wind data obtained from https://www.remss.com/missions/amsr/
    * AMSR data are produced by Remote Sensing Systems and were sponsored by the NASA AMSR-E
        Science Team and the NASA Earth Science MEaSUREs Program.
        Data are available at www.remss.com. 
* Additional AMSR2 data obtained from https://www.nesdis.noaa.gov/


Setup System Environment Variables
----------------------------------

```bash

    # GEOIPS_BASEDIR will contain all source, output, and external dependencies
    # Ensure this is consistently set for all installation / setup steps below
    export GEOIPS_BASEDIR=$HOME/geoproc

    # GEOIPS_REPO_URL should point to the base URL for git clone commands
    export GEOIPS_REPO_URL=https://github.com/NRLMMD-GeoIPS

    # This config file must be sourced ANY TIME you want to run geoips
    export GEOIPS_CONFIG_FILE=$GEOIPS_BASEDIR/geoips_packages/geoips/setup/config_geoips

```

Obtain geoips source repo and test_data_amsr2 repo
---------------------------------------------------
```bash
    mkdir -p $GEOIPS_BASEDIR/geoips_packages/

    git clone $GEOIPS_REPO_URL/geoips.git $GEOIPS_BASEDIR/geoips_packages/geoips
    
    git -C $GEOIPS_BASEDIR/geoips_packages/geoips pull
    git -C $GEOIPS_BASEDIR/geoips_packages/geoips checkout -t origin/dev
    git -C $GEOIPS_BASEDIR/geoips_packages/geoips checkout dev
    git -C $GEOIPS_BASEDIR/geoips_packages/geoips pull

    git clone ${GEOIPS_REPO_URL}/test_data_amsr2.git ${GEOIPS_BASEDIR}/test_data/test_data_amsr2
    git -C ${GEOIPS_BASEDIR}/test_data/test_data_amsr2 pull
    git -C ${GEOIPS_BASEDIR}/test_data/test_data_amsr2 checkout -t origin/dev
    git -C ${GEOIPS_BASEDIR}/test_data/test_data_amsr2 checkout dev
    git -C ${GEOIPS_BASEDIR}/test_data/test_data_amsr2 pull
```

IF REQUIRED: Install and test base geoips conda environment
------------------------------------------------------------
```bash
    # SKIP IF YOU HAVE ALREADY INSTALLED BASE GEOIPS CONDA ENVIRONMENT 
    # This prompts you through all the steps of installing the geoips conda environment from scratch,
    # using the parameters specified above.  This only needs to be done once per system, skip if you
    # already ran this step.
    $GEOIPS_BASEDIR/geoips_packages/geoips/base_install_and_test.sh dev
```

Run sample test scripts
-----------------------
```bash
    # Setup geoips environment variables
    source $GEOIPS_CONFIG_FILE

    # Runs geoips-based test
    $GEOIPS/tests/scripts/amsr2.tc.89H-Physical.imagery_annotated.sh
```
