#!/bin/tcsh
#===============================================================================
#+
# NAME:
#   make_gallery
#
# PURPOSE:
#   Make a 4xN simple gallery of images for the Spotter's Guide, as an html
#   snippet.
#
# COMMENTS:
#
# INPUTS:
#   *.png             All the images in the $cwd
#
# OPTIONAL INPUTS:
#   -h --help         Print this header
#
# OUTPUTS:
#
# EXAMPLES:
#
#   cd public/images/guide/lenses/gallery/
#   make_gallery.csh
#
# BUGS:
#
# REVISION HISTORY:
#   2013-07-30  started: Marshall (KIPAC)
#-
# ==============================================================================

set help = 0
set images = ()

while ( $#argv > 0 )
    switch ($argv[1])
    case -h:        
        shift argv
        set help = 1
        breaksw
    case --{help}:       
        shift argv
        set help = 1
        breaksw
    case *:
        set images = ( $images "$argv[1]" )
        shift argv
        breaksw
    endsw
end

if ($help) then 
    more $0
    goto FINISH
endif

if ($#images == 0) then
    echo "Error: no images supplied"
    goto FINISH
endif

set Ncol = 4
set dx = `echo "(800/$Ncol) - 10" | bc | cut -d'.' -f1`

# ----------------------------------------------------------------------------

echo '================================================================================'
echo '               Making an image gallery for the Spotters Guide                   '
echo '================================================================================'

# Check we are in the right place!

if ($cwd:t == 'public' && -e images) then
    echo "make_gallery: we are in the correct directory, proceeding..."
else
    echo "make_gallery: Error: this script should be run in Lens-Zoo/public"
    goto FINISH
endif

# ----------------------------------------------------------------------------

set snippet = gallery.html
echo "              <section data-type='gallery'>" > $snippet

set N = $#images
set k = 0

while ($k < $N)
    
    foreach j ( `seq $Ncol` )

        @ k = $k + 1
        if ($k > $N) break
        set image = $images[$k]

        echo "              <img class='lazy' src='' data-original='$image' width='$dx' height='$dx'>" >> $snippet
        echo -n "." 
    end
    
    echo "              <p></p>" >> $snippet
end

echo "              </section>" >> $snippet

echo "... Done. Gallery snippet written to $snippet"

# ----------------------------------------------------------------------------

echo '================================================================================'

# ============================================================================
FINISH:
