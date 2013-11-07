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
# generic, but have the content they pull be changed. All of the website text
# is in translations/en_us.coffee, which in principle just grows with time.
# We still keep a record of what was used in each project though.

set files = ( \
app/translations/en_us.coffee \
app/views/home.eco \
app/views/guide.eco \
app/views/faq.eco \
app/views/about.eco \
app/views/navigation.eco \
app/controllers/classifier.coffee \
app/lib/create_feedback.coffee \
css/index.styl \
css/quick_guide.styl \
)

# Nice to keep all these in a separate directory? eg projects/CFHTLS
# and then have the filenames change as well, for clarity.

# ----------------------------------------------------------------------

echo '================================================================================'
echo '                    $Editing the Space Warps Website                       '
echo '================================================================================'

if ($update) then
    echo "reconfigure: updating files with remote changes"
else
    echo "reconfigure: survey/stage requested: $survey/$stage"
endif
echo "reconfigure: understood SW web directory to be $SW_WEB_DIR"

# Make sure we are in the right place:
echo "reconfigure: moving there now..."
chdir $SW_WEB_DIR

# and set the archive name:
set archive = projects/${survey}
set tmparchive = /tmp/projects/${survey}

# ----------------------------------------------------------------------------

# Are we up to date relative to the upstream repo at the Zooniverse?

if ($update) then

    # Merge the new edits into each project_stage branch in turn:
    
    foreach stage ( 1 2 )
        
        set branch = ${survey}_stage${stage}
            
        # Make sure we are tracking remote branch:
        git checkout -b $branch origin/$branch >& msg
        set fail = `grep fatal msg | grep -v "already exists" | wc -l`
        cat msg
        if ($fail) then
          goto FINISH
        endif  
         
        # Now switch to that branch - checkouts can fail if there are
        # uncommitted edits...
        git checkout $branch >& msg
        set fail = `grep error msg | wc -l`
        cat msg
        if ($fail) then
          goto FINISH
        endif  
      
        # And make sure it is up to date with the origin:
        echo "reconfigure: making sure the ${branch} branch is up to date..."
        git pull origin $branch
        
                
        # Update the archive copies of the reconfigured files:
        echo "reconfigure: copying updated files into dev branch projects folder"
        
        mkdir -p ${tmparchive}
        foreach file ($files)
            if (${file:h:t} == 'translations') then
                set newfile = ${tmparchive}/${file:t:r}_${survey}.${file:e}
            else
                set newfile = ${tmparchive}/${file:t:r}_${survey}_stage${stage}.${file:e}
            endif
            cp -v $file $newfile
        end
        
        # Commit changes:
        
        git status >& msg
        set pass = `grep nothing msg | grep 'to commit' | wc -l`
        cat msg
        if ($pass) then
          echo "reconfigure: nothing to commit in this branch."
        else
          echo "reconfigure: committing all changes..."
          git commit -am "Merged in edits from origin"
        endif  
      
        # Can now switch to dev branch, and merge in archived files from 
        # each project_stage branch:
        
        echo "reconfigure: merging back to archive folder in dev branch..."

        git checkout dev >& msg
        set fail = `grep error msg | wc -l`
        cat msg
        if ($fail) then
          goto FINISH
        endif
        
        foreach file ($files)
            if (${file:h:t} == 'translations') then
               set tmparchivedfile = ${tmparchive}/${file:t:r}_${survey}.${file:e}
               set archivedfile = ${archive}/${file:t:r}_${survey}.${file:e}
            else
               set tmparchivedfile = ${tmparchive}/${file:t:r}_${survey}_stage${stage}.${file:e}
               set archivedfile = ${archive}/${file:t:r}_${survey}_stage${stage}.${file:e}
            endif
            cp -v $tmparchivedfile $archivedfile
            git add $archivedfile
        end
        
        # Now, dev branch may need committing:
      
        git status >& msg
        set pass = `grep nothing msg | grep 'to commit' | wc -l`
        cat msg
        if ($pass) then
          echo "reconfigure: nothing new to commit in projects folder."
        else
          echo "reconfigure: committing all changes..."
          git commit -am "Merged in edits from origin"
        endif  
      
        # Commit changes:
        
        git status >& msg
        set pass = `grep nothing msg | grep 'to commit' | wc -l`
        cat msg
        if ($pass) then
          echo "reconfigure: nothing to commit in this branch."
        else
          echo "reconfigure: committing all changes..."
          git commit -am "Merged in edits from $branch"
        endif
        
        echo "reconfigure: dev branch updated."
        
    end
    
    echo "reconfigure: don't forget to push each branch's commits as necessary"
                
#         git status >& msg
#         set pass = `grep nothing msg | grep 'to commit' | wc -l`
#         cat msg
#         if ($pass) then
#           echo "reconfigure: nothing to commit in this branch."
#         else
#           echo -n "reconfigure: commit all changes? (y or n, def=n)"
#           set ans = $<
#           if ($ans == 'y') then
#             git commit -am "Merged in edits from $remote"
#           endif
#         endif  
# ----------------------------------------------------------------------------

else

    RECONFIGURE:

    # Make sure we are in the right branch:

    echo "reconfigure: checking out dev branch"
    git checkout dev >& msg
    set fail = `grep error msg | wc -l`
    cat msg
    if ($fail) then
      goto FINISH
    endif  

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
\rm -f msg
