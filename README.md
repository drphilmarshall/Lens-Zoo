# SpaceWarps

## Setting up
    
    git clone git@github.com:zooniverse/Lens-Zoo.git
    npm install .
    
## Starting local server

    npm run-script start

## Building subjects

    cd /path/to/ouroboros
    rails r /path/to/spacewarps/data-import/builder.rb

or to build against staging server

    RAILS_ENV=staging rails r /path/to/spacewarps/data-import/builder.rb
    ssh ubuntu@dev.zooniverse.org
    cd /rails/apps/ouroboros_staging/current
    sudo -u www-data bundle exec rails c staging
    
    # Clear the redis cache
    SpacewarpSubject.redis_set.destroy
    
    # Activate subjects
    SpacewarpGroup.activate

## Building and deploying project

    npm run-script deploy
  
  
### Notes

Played around with compressing guide pngs to jpgs.  Not really worth it, as the jpgs are larger, unless we apply a gaussian blur to reduce the noise levels.

    for f in *.png;
    do
      filename="${f%.*}";
      convert ${f} ${filename}.jpg;
      convert -strip -interlace Plane -gaussian-blur 0.01 -quality 85% ${filename}.jpg ${filename}.jpg
    done
