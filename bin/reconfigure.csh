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
#   reconfigure.csh --update CFHTLS
#
# REQUIRES:
#   Environment variable SW_WEB_DIR to be set; this is the top level 
#   directory of the Lens-Zoo website git repo.
#
# BUGS:
#
# REVISION HISTORY:
#   2013-07-16  started: Marshall (KIPAC)
#   2013-08-15  adapted to new translatable site: Marshall (KIPAC)
#-
# ==============================================================================

set help = 0
set update = 0
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
    case -u:        
        shift argv
        set update = 1
        breaksw
    case --{update}:       
        shift argv
        set update = 1
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

if ($update) then
    set NargsRequired = 1
else
    set NargsRequired = 2
endif

if ($#x < $NargsRequired) then
    echo "Error: insufficient arguments $x"
    goto FINISH
else if ($update) then
    set survey = $x[1]
    set Editing = "Updating"
else 
    set survey = $x[1]
    set stage  = $x[2]
    set Editing = "Reconfiguring"
endif

if (! $?SW_WEB_DIR) then
    echo "Error: SW_WEB_DIR environment variable not set"
    goto FINISH
endif

# List of files to be included in reconfigure. Aim to leave controllers 
# generic, but have the content they pull be changed. Most of the website text
# is in translations/en_us.coffee.

set files = ( \
app/translations/en_us.coffee \
app/views/home.eco \
app/views/guide.eco \
app/views/faq.eco \
app/views/about.eco \
app/views/navigation.eco \
app/lib/feedback.coffee \
app/lib/create_feedback.coffee \
css/index.styl \
css/common.styl \
css/quick_guide.styl \
css/pages.styl \
css/profile.styl \
css/counters.styl \
)

# Nice to keep all these in a separate directory? projects/CFHTLS
# and then have the filenames change as well, for clarity.

# ----------------------------------------------------------------------

echo '================================================================================'
echo '                    $Editing the Space Warps Website                       '
echo '================================================================================'

if ($update) then
    echo "reconfigure: updating dev branch stage 1 files with remote changes"
else
    echo "reconfigure: survey/stage requested: $survey/$stage"
endif
echo "reconfigure: understood SW web directory to be $SW_WEB_DIR"

# Make sure we are in the right place:
echo "reconfigure: moving there now..."
chdir $SW_WEB_DIR

# and that the right archive exists:
set archive = $SW_WEB_DIR/projects/${survey}
mkdir -p $archive


# ----------------------------------------------------------------------------

# Are we up to date relative to the upstream repo at the Zooniverse?

if ($update) then

    # Get all new files:

    echo "reconfigure: pulling in remote updates from the Zooniverse..."
    git checkout master
    git fetch upstream
    git merge upstream/master

    # Reconfigure back to Stage 1 (using this very script!):

    echo "reconfigure: reconfiguring to Stage 1..."
    git checkout dev
    $SW_WEB_DIR/bin/reconfigure.csh $survey 1

    # Merge in the new files:

    echo "reconfigure: merging in any updates..."
    git merge master

    # Update the stage 1 copies:

    echo "reconfigure: copying updated files into stage 1 backups"

    # Note that the backups do not need to exist at this point!
    # BUG: what if upstream is configured to Stage 2?! Need a STATE cookie... 
    foreach file ($files)
        if (${file:h:t} == 'translations') then
            set newfile = ${archive}/${file:t:r}_${survey}.${file:e}
        else
            set newfile = ${archive}/${file:t:r}_${survey}_stage${stage}.${file:e}
        endif
        cp -v $file $newfile
    end

    echo "reconfigure: completed. Site is now configured for $survey Stage 1"
    
    # Now check in?
    # git commit -m "Updates from the Zooniverse"

    # No - leave this for manual operation, better that way!

# ----------------------------------------------------------------------------

else

    RECONFIGURE:

    # Make sure we are in the right branch:

    echo "reconfigure: checking out dev branch"
    git checkout dev

    # Copy relevant files into place:
    echo "reconfigure: copying requested files into place:"

    # First write down all the cp commands, and check they will work:
    set comfile = ./reconfigure.commands ; \rm -f $comfile

    foreach file ($files)
        if (${file:h:t} == 'translations') then
            set newfile = ${archive}/${file:t:r}_${survey}.${file:e}
        else
            set newfile = ${archive}/${file:t:r}_${survey}_stage${stage}.${file:e}
        endif
        if (! -e $newfile) then
            echo "reconfigure: WARNING: $survey stage $stage version of $file does not exist"
            echo "reconfigure: creating it by copying current version..."
            echo "cp -v $file $newfile" >> $comfile
        endif
        echo "cp -v $newfile $file" >> $comfile
    end

    # Actually do the copying:
    source $comfile
    \rm -f $comfile

    echo "reconfigure: complete. Site is now configured for $survey Stage $stage"

# ----------------------------------------------------------------------------

endif

echo '================================================================================'

# ==============================================================================
FINISH:
