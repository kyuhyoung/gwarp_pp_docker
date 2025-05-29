#!/usr/bin/env bash
set -e
#dir_data=/data/jax/jax_214_all_ba_including_config
if [ -n "$1" ]; then
    dir_data="$1"
else
    dir_data=/data/jax/jax_068_crop_ba_rgb_part
fi

if [ -n "$2" ]; then
    val_no_data="$2"
else
    val_no_data=0
fi
echo "val_no_data : $val_no_data"

#echo "dir_data $dir_data"
path_dsm=${dir_data}/s2p_out/dsm.tif
#path_dem=${dir_data}/s2p_out/dem_fake.tif
dir_out=$dir_data/gwarp_out
dir_cache=./cache

rm -rf $dir_cache

#echo "aaa"
bash compile.sh
#echo "bbb"
python orthorectify.py -folder_img $dir_data -folder_rpc $dir_data -dsm_file $path_dsm -folder_output $dir_out -cache_dir $dir_cache -nodata $val_no_data # -dem_file $path_dem 
