#!/bin/sh -l
#==========================================================================
# Description: This script runs plot_fields.ncl and sets all of the command-
#              line arguments.  There are 6 examples.  The default plot is at
#              the bottom on this file and plots FV3 output on a subregion over
#              CONUS with an outline of the RAP boundary.  Parameters that should
#              be modified by the user at the top of this script are:
#
#                 input_file        # An FV3 netcdf output file
#                 grid_dir          # The location of your input file
#                 fields            # A field to plot from input_file
#                 nlev              # A vertical level for (time,x,y,x) fields
#                 fcst_index        # A time index to plot
#
#              There is more documentation at the top of plot_fields.ncl and
#              in the README file.
#
# Usage: ./make_FV3_RAP_domain_plots.sh
#==========================================================================

set -eux

module load intel
module load ncl/6.4.0

RES="96"
#RES="384"

CRES="C${RES}"

input_file="atmos_4xdaily.nc"     # FV3 output file
fields="u1000"                    # Fields to plot from input_file
nlev="50"                         # Vertical index to plot for 3D fields
fcst_index="2"                    # Time index of forecast to plot
#grid_dir="/scratch3/BMC/det/beck/FV3-CAM/work.C384r0p7n3_regional_RAP/INPUT"
#grid_dir="/scratch3/BMC/fim/Gerard.Ketefian/regional_FV3_EMC_visit_20180509/work_FV3_regional_C96_2018032900/INPUT"
grid_dir="/scratch3/BMC/fim/Julie.Schramm/regional_FV3_EMC_visit_20180509/work_FV3_regional_C96_2018032900/INPUT"
#grid_dir="/scratch3/BMC/fim/Gerard.Ketefian/regional_FV3_EMC_visit_20180509/work_FV3_regional_C96_2018032900/INPUT"

#RAP_grid_fn="/scratch3/BMC/fim/Gerard.Ketefian/regional_FV3_EMC_visit_20180509/geo_em.d01.nc"
RAP_grid_fn="/scratch3/BMC/fim/Gerard.Ketefian/regional_FV3_EMC_visit_20180509/geo_em.d01.RAP.nc"

if [ 0 = 1 ]; then
#
# Show FV3 regional domain (tile 7) and the original RAP domain outline
# on a global cylindrical projection.
#
ncl -n plot_fields.ncl \
  grid_dir=\"$grid_dir\" \
  input_file=\"$input_file\" \
  fields=\"${fields}\" \
  nlev=${nlev} \
  fcst_index=${fcst_index} \
  res=${RES} \
  tile_inds=\(/7/\) \
  draw_tile_bdy=True \
  draw_tile_grid=False \
  draw_RAP_domain=True \
  RAP_grid_fn=\"$RAP_grid_fn\" \
  draw_RAP_bdy=True \
  draw_RAP_grid=False \
  map_proj=\"cyln\" \
  graphics_type=\"png\"
#
fi

if [ 0 = 1 ]; then
#
# Show FV3 regional domain (tile 7) and the original RAP domain outline
# on a sphere (orthogonal spherical projection).
#
ncl -n plot_fields.ncl \
  grid_dir=\"$grid_dir\" \
  input_file=\"$input_file\" \
  fields=\"${fields}\" \
  nlev=${nlev} \
  fcst_index=${fcst_index} \
  res=${RES} \
  tile_inds=\(/7/\) \
  draw_tile_bdy=True \
  draw_tile_grid=False \
  draw_RAP_domain=True \
  RAP_grid_fn=\"$RAP_grid_fn\" \
  draw_RAP_bdy=True \
  draw_RAP_grid=False \
  map_proj=\"ortho\" \
  map_proj_ctr=\(/-105,50/\) \
  graphics_type=\"png\"
#
fi

if [ 0 = 1 ]; then
#
# Show FV3 regional domain (tiles 5,6,7) and the original RAP domain outline
# on a cylindrical projection.
#
ncl -n plot_fields.ncl \
  grid_dir=\"$grid_dir\" \
  input_file=\"$input_file\" \
  fields=\"${fields}\" \
  nlev=${nlev} \
  fcst_index=${fcst_index} \
  res=${RES} \
  tile_inds=\(/5,6,7/\) \
  draw_tile_bdy=True \
  draw_tile_grid=True \
  draw_RAP_domain=True \
  RAP_grid_fn=\"$RAP_grid_fn\" \
  draw_RAP_bdy=True \
  draw_RAP_grid=True \
  map_proj=\"cyln\" \
  subreg=\(/-47,-40,15,22/\) \
  graphics_type=\"png\"
#
fi

if [ 0 = 1 ]; then
#
# Show FV3 regional domain (tile 7) and the original RAP domain outline
# on a global cylindrical projection (no subregion).
#
ncl -n plot_fields.ncl \
  grid_dir=\"$grid_dir\" \
  input_file=\"$input_file\" \
  fields=\"${fields}\" \
  nlev=${nlev} \
  fcst_index=${fcst_index} \
  res=${RES} \
  tile_inds=\(/7/\) \
  draw_tile_bdy=False \
  draw_tile_grid=False \
  draw_RAP_domain=True \
  RAP_grid_fn=\"$RAP_grid_fn\" \
  draw_RAP_bdy=True \
  draw_RAP_grid=False \
  map_proj=\"cyln\" \
  graphics_type=\"png\"
#

fi

if [ 0 = 1 ]; then
#
# Show FV3 regional domain (tile 7) and the original RAP domain outline
# on a global cylindrical projection (no subregion). Drawing tile boundary
# and grid makes a black tile 7 over CONUS.
#
ncl -n plot_fields.ncl \
  grid_dir=\"$grid_dir\" \
  input_file=\"$input_file\" \
  fields=\"${fields}\" \
  nlev=${nlev} \
  fcst_index=${fcst_index} \
  res=${RES} \
  tile_inds=\(/7/\) \
  draw_tile_bdy=True \
  draw_tile_grid=True \
  draw_RAP_domain=False \
  RAP_grid_fn=\"$RAP_grid_fn\" \
  draw_RAP_bdy=True \
  draw_RAP_grid=False \
  map_proj=\"cyln\" \
  graphics_type=\"png\"
#  subreg=\(/-47,-40,15,22/\) \
#  tile_inds=\(/1,2,3,4,5,6/\) \
#  subreg=\(/-120,-70,20,70/\) \
#  subreg=\(/-150,-40,0,70/\) \
#  subreg=\(/-120,-70,20,70/\) \
#

fi

if [ 1 = 1 ]; then
#
# Show FV3 regional domain (tile 7) and the original RAP domain outline
# on a subregional cylindrical projection centered over CONUS.
#
ncl -n plot_fields.ncl \
  grid_dir=\"$grid_dir\" \
  input_file=\"$input_file\" \
  fields=\"${fields}\" \
  nlev=${nlev} \
  fcst_index=${fcst_index} \
  res=${RES} \
  tile_inds=\(/7/\) \
  draw_tile_bdy=True \
  draw_tile_grid=False \
  draw_RAP_domain=False \
  RAP_grid_fn=\"$RAP_grid_fn\" \
  draw_RAP_bdy=True \
  draw_RAP_grid=False \
  map_proj=\"cyln\" \
  subreg=\(/-135,-60,10,60/\) \
  graphics_type=\"png\"
#  subreg=\(/-47,-40,15,22/\) \
#  tile_inds=\(/1,2,3,4,5,6/\) \
#  subreg=\(/-120,-70,20,70/\) \
#  subreg=\(/-150,-40,0,70/\) \
#  subreg=\(/-120,-70,20,70/\) \
#

fi
