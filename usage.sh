#!/usr/bin/env bash
set -e
#dir_data=/data/jax_214_all_ba_including_config
dir_data=/data/jax_068_crop_ba_rgb_part
path_dsm=${dir_data}/s2p_out/dsm.tif
#path_dem=${dir_data}/s2p_out/dem_fake.tif
dir_out=./output
dir_cache=./cache

rm -rf $dir_cache

bash compile.sh
python orthorectify.py -folder_img $dir_data -folder_rpc $dir_data -dsm_file $path_dsm -folder_output $dir_out -cache_dir $dir_cache -nodata 0 # -dem_file $path_dem 
