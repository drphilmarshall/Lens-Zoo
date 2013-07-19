#!/bin/tcsh
#===============================================================================
#+
# NAME:
#   reconfigure
#
# PURPOSE:
#   Reconfigure the dev version of the Space Warps website, prior to testing
#   and then potentially merging into the master branch and launching. 
#
# COMMENTS:
#
# INPUTS:
#   survey            Name of survey (required).
#   stage             Stage (1 or 2, required)
#
# OPTIONAL INPUTS:
#   -h --help         Print this header
#
# OUTPUTS:
#
# EXAMPLES:
#
#   reconfigure.csh  CFHTLS 2
#
# BUGS:
#
# REVISION HISTORY:
#   2013-07-16  started: Marshall (KIPAC)
#-
# ==============================================================================

set help = 0
set survey = 0
set stage = 0
set x = ()

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
        set x = ( $x $argv[1] )
        shift argv
        breaksw
    endsw
end

if ($help) then 
    more $0
    goto FINISH
endif

if ($#x < 2) then
    echo "Error: insufficient arguments, both survey and stage needed"
    goto FINISH
else
    set survey = $x[1]
    set stage  = $x[2]
endif

if (! $?SW_WEB_DIR) then
    echo "Error: SW_WEB_DIR environment variable not set"
    goto FINISH
endif

# List of files to be included in reconfigure:

set files = ( \
public/index.html \
app/views/classifier.eco \
app/views/profile_subjects.eco \
)

# ----------------------------------------------------------------------

echo '================================================================================'
echo '                    Reconfiguring the Space Warps Website                       '
echo '================================================================================'

echo "reconfigure: survey/stage requested: $survey/$stage"
echo "reconfigure: understood SW web directory to be $SW_WEB_DIR"

# Make sure we are in the right place:
echo "reconfigure: moving there now..."
chdir $SW_WEB_DIR

# First make sure 

# Now make sure we are in the right branch:
echo "reconfigure: checking out dev branch"
git checkout dev

# Copy relevant files into place:
echo "reconfigure: copying requested files into place:"

# First write down all the cp commands, and check they will work:
set comfile = ./reconfigure.commands ; \rm -f $comfile

foreach file ($files)
    set newfile = ${file:r}_${survey}_stage${stage}.${file:e}
    if (-e $newfile) then
        echo "cp -v $newfile $file" >> $comfile
    else
        echo "reconfigure: $survey stage $stage version of $file does not exist, exiting"
        goto FINISH
    endif
end

# Actually do the copying:
source $comfile
\rm -f $comfile

echo "reconfigure: complete. Site is now configured for $survey Stage $stage"

echo '================================================================================'

# ==============================================================================
FINISH:
