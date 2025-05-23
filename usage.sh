#!/usr/bin/env bash
set -e
dir_data=/data/jax/jax_214_all_ba_including_config
path_dsm=${dir_data}/s2p_out/dsm.tif
path_dem=${dir_data}/s2p_out/dem_fake.tif
dir_out=./output
dir_cache=./cache

rm -rf $dir_cache

bash compile.sh
python orthorectify.py -folder_img $dir_data -folder_rpc $dir_data -dsm_file $path_dsm -dem_file $path_dem -folder_output $dir_out -cache_dir $dir_cache
