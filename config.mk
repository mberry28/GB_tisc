#------------------------------------------------------------------------
#You may need to modify these variables
#C compiler:
CC	= /usr/bin/gcc #gcc #cc 
#Fortran compiler (only needed if THIN_SHEET is defined below):
FC	= /usr/bin/gfortran #fort77 /opt/intel/fce/10.1.008/bin/ifort -O3 -nofor-main -static #f90 #g77 #f90 
LIBS	= -lm -lc 
#Program parts to include:
DEFS =   -DSURFACE_TRANSPORT  
# Things you might add to DEFS:
# -DTHIN_SHEET 
# -DSURFACE_TRANSPORT 

#CHOSE YOUR SYSTEM:
OPTS	= $(OPTS_linux)
#Options depending on the compiler/system:
OPTS_linux = -g -O3 -w -std=c99 #-O3 -Wuninitialized #-Wno-unused-result #-Wparentheses 
OPTS_AIX_RS6000 = -g -O3 #-Q -qsrcmsg -qmaxmem=4000 #-v
OPTS_SUN = -xO5 #-fast #-O3 -xO5 -g -fast -W
#------------------------------------------------------------------------
