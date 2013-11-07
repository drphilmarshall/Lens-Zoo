module.exports =
  navigation:
    classify: 'Classify'
    about: 'About'
    guide: "Spotter's Guide"
    discuss: 'Discuss'
    profile: 'Profile'
    faq: 'FAQ'

  home:
    heading: "Imagine a galaxy, behind another galaxy.<br/>Think you won't see it? Think again."
    subheading: "Massive galaxies warp space-time around themselves, bending light rays so that we can see around them. They're the Universe's own telescopes, but these gravitational lenses are very rare: we need your help to find them!"
    discover: "Discover Lenses"
    discover_snippet: "Help scientists identify these very rare astronomical objects."
    refine_snippet: "Help scientists refine a sample of Space Warps lens candidates."
    learn: "Learn about Lenses"
    learn_snippet: "Find out more about the lenses you might spot in Space Warps."
    news: "Latest News"
    news_snippet: "Take a look to see what's happening."
    get_started: "Get Started"

  profile:
    no_user: "Please sign in to keep track of your classifications."
    loading: "Just a moment..."
    favorites: "Favorites"
    recents: "Recents"

  counters:
    images_viewed: "images viewed"
    potential_lenses: "potential lenses"
    favorite_images: "favorite images" 
    sim_freq: "simulation frequency"
    sim_freq_tip: "This shows the frequency of simulations that you will be shown."

  classifier:
    remove_markers: "Remove All Markers"
    favorite: "Save this image to your profile."
    discuss: "Discuss this image in Talk."
    dashboard: "Explore this image further with Quick Dashboard."
    next: "Next"

  quick_guide:
    heading: "Spotter's Guide"
    instructions: "Click on the thumbnails to find out more."
    lenses: "Lenses"
    nonlenses: "Non-lenses"

    lens_examples:
      example_1:
        title: "A distant quasar being lensed by a massive galaxy in the foreground."
        image: "images/guide/lenses/galaxy-quasar/CFHTLS_082_0427_gri_zoom.png"
        data_type: "lensed-quasars"
      example_2:
        title: "An edge-on spiral galaxy acting as a gravitational lens."
        image: "images/guide/lenses/disk-galaxy/CFHTLS_024_2215_gri_zoom.png"
        data_type: "lensed-galaxies"
      example_3: 
        title: "A group of massive galaxies acting as a gravitational lens."
        image: "images/guide/lenses/cluster-galaxy/CFHTLS_052_1191_gri_zoom.png"
        data_type: "lensing-clusters"
      example_4:
        title: "A distant blue galaxy being lensed by a massive galaxy in the foreground."
        image: "images/guide/lenses/elliptical-galaxy/CFHTLS_030_2132_gri_zoom.png"
        data_type: "lensed-galaxies"
      example_5:
        title: "A distant blue galaxy being lensed by a massive galaxy in the foreground."
        image: "images/guide/lenses/elliptical-galaxy/CFHTLS_039_1471_gri_zoom.png"
        data_type: "lensed-galaxies"
      example_6:
        title: "A distant quasar being lensed by a massive galaxy in the foreground."
        image: "images/guide/lenses/galaxy-quasar/CFHTLS_082_1138_gri_zoom.png"
        data_type: "lensed-quasars"

    non_lens_examples:
      example_1: 
        title: "Some lightweight galaxies have arms and tails that can look like lensed arcs."
        image: "images/guide/non-lenses/lightweights/CFHTLS_022_14405_13384_b_gri_zoom.png"
        data_type: "lightweights"
      example_2: 
        title: "Some lightweight galaxies have arms and tails that can look like lensed arcs."
        image: "images/guide/non-lenses/lightweights/CFHTLS_084_6943_2087_b_gri_zoom.png"
        data_type: "mergers-neighbors"
      example_3: 
        title: "Some faint blue galaxies are naturally long and curved; if you see one without a massive galaxy nearby, it’s not being lensed."
        image: "images/guide/non-lenses/loners/CFHTLS_050_8615_13075_b_gri_zoom.png"
        data_type: "loners"
      example_4: 
        title: "Some faint blue galaxies are naturally long and curved; if you see one without a massive galaxy nearby, it’s not being lensed."
        image: "images/guide/non-lenses/loners/CFHTLS_110_1042_7688_b_gri_zoom.png"
        data_type: "loners"
      example_5: 
        title: "Spirals and ring galaxies can host blue arc-like features. However, they are often larger, fuzzier, or too asymmetric to be lensed arcs."
        image: "images/guide/non-lenses/spirals-rings/CFHTLS_001_1555_gri_zoom.png"
        data_type: "mergers-neighbors"
      example_6: 
        title: "Spirals and ring galaxies can host blue arc-like features. However, they are often larger, fuzzier, or too asymmetric to be lensed arcs."
        image: "images/guide/non-lenses/spirals-rings/CFHTLS_074_0786_gri_zoom.png"
        data_type: "rings-spirals"

  tutorial:
    welcome:
      header: "Welcome to Space Warps!"
      details: "Gravitational Lenses are very rare astronomical objects. We need your help finding them!"
    what_are_lenses_1: 
      header: "What are gravitational lenses?"
      details: "Gravitational lenses are massive astronomical objects &ndash; such as galaxies &ndash; that lie in front of other, more distant galaxies. These massive objects act like huge, natural magnifying glasses. They focus light from distant objects towards us, allowing us to see further into the Universe."
    what_are_lenses_2:
      header: "What do gravitational lenses look like?"
      details: "Gravitational lenses can look different, depending on how they line up along the line-of-sight to us, and on the shape and type of the foreground lens and background objects."
    spotters_guide: 
      header: "Spotter's Guide"
      details: "Check out The Spotter's Guide  for detailed descriptions and reference images of Real Lenses and False Positives.  You can use the Spotter's Guide as a reference throughout your time on Space Warps."
    identify: 
      header: "Identifying gravitational lenses"
      details: "The yellow-ish looking galaxy is a gravitational lens. It is bending and magnifying the light from a faint blue galaxy, lying far behind, into a blue arc that surrounds the lensing galaxy."
    mark: 
      header: "Marking lensed features"
      details: "If you see something that is being lensed, mark it. In this case, click on the blue arc."
    good_job:
      header: "Great job!"
      details: "You’ve correctly identified a gravitational lens!<br/><br/>To remove a marker, just click it and you'll see the remove button."
    try_again:
      header: "Whoops, try again."
      details: "Drag the marker over the blue arc to identify the lens."
    training:
      header: "Training images"
      details: "From time to time we'll throw in a training image like this one, that contains a simulated or previously known gravitational lens. We'll let you know if you spot the lenses in training images."
    thanks:
      header: "Thanks!"
      details: "Remember lensed galaxies are rare: many of the images you will see won't contain a gravitational lens. You can keep track of the expected lens frequency as you go at the top of this page.<br/><br/>Over your first few classifications we'll give you a few more tips and access to some different tools to help you as you search for these rare objects.<br/><br/>Click 'Finished marking!' to continue."
    talk:
      header: "Talk"
      details: "Talk is a place to discuss the things you find with the rest of the Space Warps community: together we aim to build a catalog of new lenses, some of the rarest objects in the universe. If you have questions, the Science Team and other astronomers will help answer them. If you find something that looks interesting, come and show it to the group!"
    dashboard:
      header: "Quick Dashboard"
      details: "As gravitationally lensed features can be faint and/or small, you can explore an image in more detail in the Quick Dashboard. Try clicking on this button."

  feedback:
    base_header: "You spotted a simulated lens."
    headers:
      nice_catch: 'Nice catch!'
      super: 'Super!'
      great: 'Great!'
      good_job: 'Good job!'
      well_done: 'Well done!'
      yesss: 'Yessss!'
      jolly_good: 'Jolly good!'
      excellent: 'Excellent!'
      marvellous: 'Marvellous!'
      splendid: 'Splendid!'
      wonderful: 'Wonderful!'
      terrific: 'Terrific!'
      lovely: 'Lovely!'
    details:
      lensing_cluster:
        option_1: "Groups/Clusters of galaxies are the most massive objects in the universe! They can cause arcs to appear many galaxy diameters away from the centre of the group."
        option_2: "The massive galaxies in a lensing group typically have similar yellow-red colors. This should help you figure out which galaxies are in the group, and which are not."
        option_3: "Typically, any lensed arcs will appear to be surrounding the cluster as a whole - although galaxies within the cluster can also act as lenses on their own."
        option_4: "If you see an arc, look for a “counter-image” with the about the same color and brightness somewhere else around the centre of the group, usually on the opposite side. Mark the counter-images as well, if you can!"
        option_5: "Remember, the arcs are most likely to be blue, but can be yellow or red in some cases. Multiple “images” of the same background galaxy are always the same color as each other! Try and mark each one."
        option_6: "The large separation between the group centre and the arc suggests that more mass is required in the lens than meets the eye: groups/clusters are mostly made of Dark Matter!"
        option_7: "You can read more about group lenses in the <em>Spotters Guide</em>."
      lensed_quasar:
        option_1: "Typically, lensed quasar systems show either two ('doubles') or four ('quads') small lensed features, which look like stars. Mark each of the two, or four, quasars that you see!"
        option_2: "See how the 'multiple images' of the background quasar are arranged in symmetrical patterns around the lens galaxy. Mark each one! You might have to zoom in, using the Quick Dashboard."
        option_3: "Most lensed quasars look blue, but the more distant ones look fainter, and yellow or red (having been 'redshifted' by the expansion of the universe)."
        option_4: "Quasars look different from other galaxies, because we are not seeing starlight but rather the light from supermassive black holes in their centres. These monsters often outshine the light from the rest of the galaxy."
        option_5: "We expect lensed quasars to be about 10 times rarer than lensed galaxies, but they are really useful. You can read more about what we use gravitational lenses for on the <em>Science</em> page."
        option_6: "You can read more about lensed quasars in the <em>Spotters Guide</em>."
      lensed_galaxy:
        option_1: "The most common background galaxies in the universe (those little blobs you see everywhere) are faint, blue, and star-forming, so usually (but not always!), lensed galaxies appear blue."
        option_2: "Unlike most little blue galaxies you see, lensed galaxies appear stretched and curved around the lens."
        option_3: "The lensed features in these systems are typically only a galaxy diameter or two away from the centre of the lens. You might have to zoom in, with the Quick Dashboard!"
        option_4: "Look for a faint “counter-image” with the same colour on the opposite side of the lens to the arc. Sometimes these are too faint to see though. Mark the counter-image too, if you can!"
        option_5: "The galaxy acting as a lens is most likely to be a bright, smooth, yellow or red elliptical galaxy, since these are the most massive galaxies."
        option_6: "Very occasionally, if the cosmic alignment is very precise, the galaxy behind the lens will appear as an almost exactly circular Einstein Ring."
        option_7: "You can read more about lensed galaxies in the <em>Spotters Guide</em>."
      missed:
        option_1: "This image actually contains a simulated lens. Have you tried using the Quick Dashboard to get a better view?"
        option_2: "This image actually contains a simulated lens. Have a browse around the site for some tips!"
        option_3: "This image actually contains a simulated lens. Don't worry, you can see all your recent images on your profile page." 
        option_4: "This image actually contains a simulated lens. If you're not sure, why not head over to Talk to discuss this image?"
    dud_found:
      header: "Nice! There is no gravitational lens in this field!"
      details: "This is a different kind of Training Image, one that has already been inspected by the Science Team and found not to contain any gravitational lenses."
    dud_missed:
      header: "There is no gravitational lens in this field!"
      details: "This is a different kind of Training Image, one that has already been inspected by the Science Team and found not to contain any gravitational lenses."
    false_positives:
      success: "Well done - you correctly ignored the false positive in this field:"
      failure: "False positive! There are no gravitational lenses in this field..."
      CFHTLS_stage2_fps:
        stars: "Yellow-red (or white-blue or white-green) stars can look like lens galaxies, but are smaller, very close to circular, and in CFHTLS images often have 'spikes' coming out of them at 12, 3, 6 and 9 o clock."
        stars_1: "A bright blue star, that has two red compact sources neighbouring it i.e. there is no lensing galaxy in this image. Also, if the two red compact sources were lensed background galaxies, they would be symmetrically arranged either side of the lens to be a lensing feature."
        stars_2: "The red object is not a galaxy but a single red star (that cannot act as a lens). Stars are more defined than fuzzy galaxies (see the yellow galaxies in this field). The neighbouring blue 'arc' is also too thick and not curved enought around the 'lens' to be a plausible lensed arc."
        stars_3: "Two blue objects flank a yellow object, however this is not a gravitational lens. The objects have the shapes of stars, not extended or compact galaxies that are seen in the same image. This is just a chance alignment of two blue stars and a red star in between."
        stars_4: "The yellow object that has two blue objects around it is a star, so it cannot act as a lens. The blue objects either side of the star are a little fuzzy and slightly different colours, and could be background galaxies. The red pair of objects close by are likely to be foreground red stars. This is just a chance alignment."
        stars_5: "This bright blue star has a neighbouring yellow galaxy close to it. The apparently curved shape of the yellow galaxy makes this look a bit like a gravitational lens, but a star cannot act as a lens (it doesn't have enough mass) do this is just a chance alignment of a galaxy and a star."
        stars_6: "This field contains several bright stars that cause lots of unusual effects on the images. The object to the lower middle is such a star, not a gravitational lens. The pink and blue colours arise from different effects on the images seen in different filters. So the blue ring you see is because the light from the star caused a larger area of the CCD to be affected than in the green or red bands. The neighbouring blue blobs either side are just aligned by chance."
        stars_7: "This field contains a red object flanked by two blue objects. The shape of the red object and the blue object to the left suggest that these are stars. The blue object to the right is a galaxy. This is not a lens but a chance alignment of these three unrelated objects."
        stars_8: "This is a bright yellow star, with two beighbouring blue stars. While the blue sources have very similar colours and are compact, if they were really lensed background galaxies/QSOs they would appear on opposing sides of the lensing mass. Therefore this is not a lens but a chance alignment of these unrelated objects."
        stars_9: "The potential lens here is a red star that appears to have blue arc and a blue compacts sources near it. This is not a lens as the central object is a star. The arc and blue point sources are just background sources that happen to lie here."
        red_sfg: "Spiral and ring galaxies often have red bulges that can mimic massive lens galaxies; their arms usually have the wrong shapes and positions to be lensed arcs though."
        red_sfg_1: "The pair of red objects are likely to be galaxies but may also be a pair of red stars; if they are galaxies, their mass is probably too low to produce such a large scale blue ring (and it is not centered well enough or the right shape to be lensed). This is most likely to be a pair of red galaxies whose interaction has generated a star-forming ring."
        red_sfg_2: "This is a red galaxy with a star forming ring or disk around it. The white compact object is likely to be a star that just happens to appear to fall in front of the galaxy along our line of sight, or possibly a supernova in the galaxy! The ring itself is rather wispy: one would expect a lensed ring to be sharper and clearer than this."
        red_sfg_3: "The compact red object at the centre of this object is a compact red galaxy core, the blue 'ring' around it is likely to be spiral arms in which star-formation is happening. The symmetry is not quite right for it to be lensed."
        red_sfg_4: "The compact red object at the centre of this object is a compact red galaxy core, the blue 'ring' around it is likely to be spiral arms or a broken ring in which star-formation is happening."
        red_sfg_5: "The compact red object at the centre of this object is likely to be a compact red galaxy core. The blue arc that is below is likely to be either a spiral arm in the disk of that galaxy that is forming stars."
        red_sfg_6: "The blue arcs around this red galaxy are likely spiral arms in which stars are forming producing the blue colour. There is a blue point like object on the opposite side of the galaxy to the arc, but its colour is a little different to the arc, and therefore this is unlikely to be a lensed arc and counter image."
        red_sfg_7: "This is a very compact red galaxy that has two very faint, blue, compact sources lying close by. If this was a lens, one would expect to see the ring continued around the galaxy or if that there would be a single arc with a compact blue counter image on the opposite side of the red galaxy. This is more likely to be a red galaxy core with a star forming disk, ring or arms around it."
        red_sfg_8: "This is likely to be a red galaxy with a star forming ring around it. The galaxy looks quite small and would therefore not be able to produce such a large lensed galaxy image around it; the shape and fuzziness of the ring are also a little different from what we woudl expect from a lens."
        config: "Lensed features have characteristic shapes, positions and definition, in combination: neighbouring galaxies, might look the right colour, or be curved, or have counterparts in the right place, but we need the whole package at once for a good lens candidate."
        config_1: "The shape of this blue arc looks too straight for it to be a lensed image (straight arcs are mostly produced by very massive galaxy clusters/groups). If the pair of blue compact sources were lensed images of a background quasar they would be on diametrically opposite sides of the lensing galaxy. Images of lensed QSOs could appear in these poisitons if a third image was present to the north, but this is not seen."
        config_2: "This is a very compact group of yellow galaxies (three members). Lensed images should have similar colours so the red and blue objects are not lensed images."
        config_3: "This is a compact red galaxy that has an elongated blue neighbour. The blue 'arc' looks rather mis-shapen and is much larger than a lensed arc this galaxy could produce. If this was a lensed arc it would be curved very nicely around the compact red object."
        config_4: "There are wispy elongated and compact blue objects around this yellow galaxy. If these were lensed images they would be arranged in a more circular fashion around the lensing galaxy. If the compact blue objects were lensed images, they would fall either side of the short axis of the lensing galaxy, not on the ling axis, so this configuration is not consistent with lensing."
        config_5: "This is actually a star-forming disk galaxy seen edge-on, that typically do not have enough mass to act as gravitational lenses. The neighbouring blue sources are unlikely to be lensed QSOs because they have different colours and shapes (the one above is very compact and bright blue, whereas the one below is more fuzzy). The blue objects are likely a foreground star (above) and below a faint blue galaxy, so this is just a chance alignment."
        config_6: "This looks to be a pair of red galaxies, with a white compact source to the left, a fuzzy whitish blob to the south and a blue fuzzy object to the north. This is not a lens as the objects are not configured in a circular fashion around the lens and do not have the same colours. This is just a random alignment of galaxies."
        config_7: "This appears to be a star forming galaxy with a compact red core. The red compact objects could be thought of as forming a quad configuration but the middle one has a different colour to the other two. This is just a chance alignment of objects and is not lensing."
        config_8: "This is a blue star-forming galaxy that has a three compact sources around it. This is not lensing because the lensed images would all be of the same colour (here two are blue and one is red), the images would be arranged differently around the lens, also typically (although not always) blue star-forming galaxies do not have enough mass to act as lenses."
        config_9: "This small yellow galaxy with two blue objects either side is not a lens system. The two bluish galaxies have different colours, if these were lensed objects they would be the same colour. Also they are too far apart to be lensed images produced by such a small yellow galaxy."
        spirals_rings: "Spiral and ring galaxies often have yellow-red bulges that can mimic massive lens galaxies; their arms usually have the wrong shapes and positions to be lensed arcs though."
        spirals_rings_1: "The long blue feature looks like a spiral arm or a broken section of a ring galaxy. This is supported by other bluish fuzzy features around the galaxy forming no particular lensing configuration expected for a typical lens."
        spirals_rings_2: "A prominent bluish ring like emission in a nearby ring galaxy. Einstein ring images are usually formed much close together to the lensing galaxy which is rather circular in shape."
        spirals_rings_3: "A spiral galaxy with bluish arms and knots showing star-forming regions. No obvious signs of any lensed images expected for a typical lens (see Spotter's guide)."
        spirals_rings_4: "A spiral barred galaxy with fuzzy gas-like emission. The bluish features in the vicinity are most likely spiral arms, they don't resemble any typical lensing configurations."
        spirals_rings_5: "A spiral galaxy with fuzzy gas-like emission and bluish arm. No sign of blue counter-image on the other side."
        spirals_rings_6: "A ring galaxy with very low surface brightness blue emission in a circle around it. The large size indicates a nearby ring galaxy. Such cases of low mass and nearby galaxies are not suitable for producing typical lensing effects."
        spirals_rings_7: "A face-on spiral galaxy with 2 bright blue knots. No counter-images of the blue knots, expected in lensing, are seen on the other side of the galaxy. Knots probably are star-forming regions in the spiral galaxy."
        spirals_rings_8: "A face-on spiral galaxy with blue spiral arms. The two smaller yellow galaxies are closeby in projection, probably. No presence of typical lensing features."
        neighbour: "Lensed features have characteristic shapes, positions and definition, in combination: neighbouring galaxies, might look the right colour, or be curved, or have counterparts in the right place, but we need the whole package at once for a good lens candidate."
        neighbour_1: "A distorted bluish arm like feature, disturbed morphology and the presence of multiple bright nuclei indicate a likely merger between two galaxies."
        neighbour_2: "The curvature of the blue arc looks right but is widely separated from the reddish yellow galaxy. This is unlikely to be a lens since more mass is required and there's no hint of a galaxy group (i.e more mass) to cause wide separation of the arc."
        neighbour_3: "The blue feature does not have the right distance, curvature, thickness with respect to the yellow galaxy to be termed as a lensed arc. Most likely two blue edge-on galaxies that are close either physically or in projection."
        neighbour_4: "Lack of curvature in the blue feature in spite of its extreme proximity to the reddish spiral galaxy suggests absence of lensing. This appears to be a blue edge-on galaxy that has a chance alignment with the reddish face-on spiral galaxy."
        neighbour_5: "A small blue galaxy appears to be in close projection to a spiral dusty galaxy. No signs of multiple lensed images."
        neighbour_6: "An edge-on spiral galaxy with distorted blue spiral arms and fuzzy gas-like emission indicates a likely merger rather than possibility of lensing."
        neighbour_7: "Several blue features around distorted yellow galaxy(s) along with the presence of gas-like emission are clear signs of a merger. The blue features do not form any expected lensing configuration."
        neighbour_8: "Two bright overlapping nuclei with spiral arms stretched out along with hints of gas is a good sign of a merger between two galaxies. No obvious signs of lensing especially because the blue feature does not lie along the tangential direction and appears more convincing as a spiral arm."
        neighbour_9: "A short straight blue object is most likely an edge-on galaxy in close projection with the massive elliptical galaxy as there's no hint of a counter-image on the other side of the elliptical."
        neighbour_10: "A galaxy with just two equally bright blue objects on the same side implies chance alignment of objects. For a real lens, two more images are expected to be seen on the other sides of the galaxy (see Spotter's Guide)."
        neighbour_11: "The blue object is not curved enough, too far from the spiral galaxy and pretty wide to look like a real lensed arc. Also, the lensing galaxy is a clear spiral implying less mass and thus, making an arc form much closer."
        loner_lightweight: "The galaxies that are massive enough to cause gravitational lensing are bright, yellow to red in colour, and typically smooth and elliptical-shaped. If you can't see a lot of stellar mass like this, what you are seeing is probably not a lens system!"
        loner_lightweight_1: "Galaxies such as the small blue one seen here do not have large enough mass to cause the wide separation seen between the two reddish objects."
        loner_lightweight_2: "The blue fuzzy spiral galaxy, usually not massive enough to cause lensing. The blue knots do not form any expected lensing configuration and do not have similar surface brightness either."
        loner_lightweight_3: "The blue round galaxy is not massive enough to cause lensing. the blue elongated object looks like another edge-on galaxy instead of a lensed arc."
        loner_lightweight_4: "This looks like a blue fuzzy spiral, not massive enough, to cause lensing with bright spots where new stars might be forming. The bright spots do not form any expected lensing configuration."

  faq:
    heading: "Frequently Asked Questions"
    interface:
      header: "Interface"
      questions: """
        <h3>What is my main task?</h3>
        <p>The main task for the current project is to inspect the images on the classification page, look for a gravitational lens and mark (at least) any one of the lensed images within a lens system in an image. Lens systems are rare. Most of the images won’t have any lenses, a few images will have a lens and in extremely rare cases, there might be more than one lens in an image. So, watch out!</p>

        <h3>I marked a simulated lens but was told that I missed it. What’s the problem?</h3>
        <p>We'd like you to mark any lensed object that you see i.e. you can mark one or all of the curved arcs, or multiple quasars. Sometimes the site will tell you that you missed a simulated lens, when you actually marked something nearby the lensed object, e.g. the marker might have been placed on the lens galaxy itself instead of the lensed features.</p>
        <h3>What do I do if I see more than one lensed image per lens system?</h3>
        <p>You should place a marker on at least one lensed feature that you see per lens system. If you see an arc, mark it and preferably, mark its counter-arc if you can see it. If you see a pair of quasars (compact objects) either side of a lensing galaxy, mark both of them preferably.</p>
        <h3>When should I use the Quick Dashboard?</h3>
        <p>Many lensed images are faint and very close to the bright yellow lensing galaxies. You can switch to the Quick Dashboard to play with different settings or zoom/pan to get a detailed view near the lensing galaxy and be more confident of not missing a faint lens.</p>
        <h3>I missed a lens! How do I go back?</h3>
        <p>The last image you saw is in your 'Recents' list, on your <a href=\"#/profile\">Profile</a>. You can click on this image to take it to Talk, where you can tag it for other people to see, and discuss it with them.</p>
        <h3>Can I delete my markers?</h3>
        <p>Yes, if you click on one of your markers, a little cross should appear above it. If you click on this cross, the marker is deleted.</p>
        <h3>Can I turn off the simulated lenses?</h3>
        <p>We found that without the simulated lenses, we started to make mistakes. We don’t want to miss any lenses, so we thought it best to keep showing simulated lenses, just in case! As you do more classifications we will show you a smaller number of simulated lenses.</p>
        <h3>Can I turn off the feedback messages?</h3>
        <p>As with the simulated lenses, we found that without the messages, we also started to make mistakes. We don’t want to miss any lenses, so we thought it best to keep the messages turned on!</p>
        <h3>The images are really small! Can I make them bigger?</h3>
        <p>Yes. Click on the Quick Dashboard, and scroll with your mouse to zoom in. You can move around in the image by dragging it with your cursor.</p>
        <h3>I found something interesting! What do I do?</h3>
        <p>The markers are only for lensed features, but you can add any image, whether you think it has a lens in it or not, to your favourites using the button. This will appear in your favourites list on your profile page. You can then click on that image to take it to Talk, where you can discuss it with with other people.</p>
        <h3>Sometimes a vertical/horizontal section of the image looks completely dark. why is that?</h3>
        <p>Nothing to worry. These images are at the edges of the survey region where the telescope did not collect data. Since there’s no data, these sections look dark.</p>
        <h3>I can't see some pages on the website. What internet browser should I use?</h3>
        <p>
          We support modern browsers, although the site is optimized for Chrome.
          <ul>
            <li>Google Chrome</li>
            <li>Firefox 19 and up</li>
            <li>Safari 5 and up</li>
            <li>Internet Explorer 10 (no support for Quick Dashboard)</li>
          </ul>
        </p>
      """
    science:
      header: "Science"
      questions: """
        <h3>What is a gravitational lens system?</h3>
        <p>When a massive galaxy, or cluster of galaxies, sitting right in front of another, much more distant galaxy, the light from the background galaxy gets deflected and focused towards us by the warped space around the foreground galaxy. This is referred to as a gravitational lens system.</p>

        <h3>What does a typical lens system look like?</h3>
        <p>A typical lens system will show a massive lensing galaxy or a galaxy group surrounded by magnified and distorted multiple images of a background galaxy.</p>
        
        <h3>What’s the difference between a lens(ing) galaxy and a lensed galaxy?</h3>
        <p>A lens galaxy or a lensing galaxy is the foreground massive galaxy which warps the space around it and causes light to bend around it. A lensed galaxy is a distant background galaxy from which light rays emerge and get bent or deflected due to the lens galaxy before arriving on earth.</p>
        
        <h3>Why are gravitational lens systems interesting?</h3>
        <p>Gravitational lenses have a plethora of applications in astrophysics. Most importantly, they are used for understanding properties of Dark Matter which is very difficult to probe by other methods. Since lens systems also create magnified images of the distant background galaxies, we get a detailed view and hence, better understanding of these distant and faint galaxies which would be impossible otherwise. Other interesting applications include measuring the age of the Universe, finding exoplanets, etc.</p>
        
        <h3>Why do you need my help to look for gravitational lenses?</h3>
        <p>How a lens system will look like in the sky depends on several factors relating to properties of the foreground and the background object. There is enough complexity in these lens systems that the process of detection has not been fully automated till date. One of the major problems is contamination from lens-like systems e.g., spiral galaxies, ring galaxies and other artefacts in the images that mimic arc-like shapes. Human beings are better at processing and filtering objects that have multiple levels of complexities even if they are non-standard. Lens systems fall in this category and we need your help both in discovering newer types of lenses and building better algorithms.</p>
        
        <h3>How do I know what’s a lens and what isn’t?</h3>
        <p>We’ve put up some examples of lenses, and non-lenses, in the Spotter’s Guide. You can see these examples on the main classification page (on the pull-out tab on the right hand side), and you can click on them to read more about them in the Guide page. You can also go to <a href='http://talk.spacewarps.org/'>Talk</a> and see what other people have found.</p>
        
        <h3>What are simulated lens systems?</h3>
        <p>Simulated lens systems are computer generated images of gravitational lens systems using standard models for a foreground galaxy (or galaxy group) and a background galaxy (or a quasar). These simulated lenses are then added to the real images of the sky observed with a telescope.</p>
        
        <h3>Why do the images have simulated lens systems?</h3>
        <p>Lens systems come in a wide variety and Spotter’s Guide page can be used to show only typical examples of lenses. Hence, we use simulated lens system to provide further training for the users. Also, we want to do a comparison of human vs. robots (ie. automated lens finding codes) for which we need a large test sample. Adding a large sample of simulated lenses to the real data help us achieve such comparison.</p>
      """

  about:
    science: "Science"
    team: "Team"
    quote: "&quot;Spacetime tells matter how to move; matter tells spacetime how to curve.&quot;<br/><em>John Archibald Wheeler</em>"
    gravitational_lensing: "Gravitational Lensing"
    lensing_text_1: "Einstein's theory of gravity, General Relativity, made a remarkable prediction. Massive objects, such as stars, would bend the space around them such that passing light rays follow curved paths. Evidence for this revolutionary theory was first obtained by Arthur Eddington in 1919, when during a solar eclipse he observed that stars near the edge of the Sun appeared to be slightly out of position. The Sun was behaving like the lens in a magnifying glass and bending the light from the background stars!"
    lensing_text_2: "In 1937, Fritz Zwicky realized that massive galaxies (which can contain anywhere from ten million to a hundred trillion stars) or clusters of galaxies could be used to magnify distant galaxies that conventional telescopes couldn’t detect. As you can see, not unlike a conventional magnifying glass, these gravitational lenses not only magnify and focus the light of the distant background galaxies but they can, and mostly do, distort them as well."
    lensing_text_3: "When one of these gravitational lenses happens to sit right in front of a background galaxy, the magnification factor can be up to x10 or even more, giving us a zoomed-in view of the distant universe, just at that particular point. Lenses can help us investigate young galaxies more than halfway across the universe, as they formed stars and started to take on the familiar shapes we see nearby."
    lensing_text_4: "Observations of the distorted background galaxy can also give us useful information about the object that is behaving as a gravitational lens. The separation and distortion of the lensed images can tell astronomers how much mass there is in the object, and how it is arranged. It’s one of the few ways we have of mapping out where the dark matter in the universe is, how clumpy it is and how dense it is near the centers of galaxies. Knowing this can provide crucial information about how galaxies evolve."
    needles: "Needles in a Haystack"
    needles_text_1: "There is a lot of interesting science to be done with gravitational lenses. The problem is that they are very rare. Only about one in a thousand massive galaxies is aligned with a background object well enough to cause it to appear multiply-imaged. We currently know of about 400 objects that are behaving as gravitational lenses, largely because we have become very good at observing the night sky! Modern optical surveys cover thousands of square degrees, with images sharp and deep enough to resolve about 1 lens per square degree. There should be thousands of lenses that we can detect, but we will need to look at millions of galaxy images to find them!"
    needles_text_2: "The ideal solution would be to get a computer to look through all of the images, but unfortunately this is not a straightforward solution. Teaching a computer to recognize the effects of gravitational lensing is not too difficult, but they can be easily confused by galaxies that look very similar to a distorted background galaxy. Also in order for the computer to run fast enough to analyse lots of images quickly, they have to cut a lot of corners, and this makes them less effective."
    discovering: "Discovering Lenses: A Human-Computer Partnership"
    discovering_text: "Human beings have a remarkable ability to recognise patterns and detect the unusual with only minimal training. With a basic understanding of what the distorted images of galaxies that have passed through a gravitational lens look like, participants in the SpaceWarps project can help discover new examples of this amazing phenomenon, and enable our survey scientists to carry out new investigations of stars and dark matter in the universe. We will be doing two types of lens search. In our blind searches, we’ll be asking volunteers to spot signs of gravitational lensing in images of the sky taken as part of the CFHT (Canada-France-Hawaii Telescope) legacy survey. This survey has been searched by computers, but we’re pretty sure they didn’t catch all the lenses to be found! These results will help us re-train the computers to do better on larger surveys in future. Then, in our targeted searches, in other upcoming sky surveys, we’ll be showing participants galaxies and groups of galaxies that our computers have selected as possibly being gravitational lenses. The task will then be to assess whether or not they actually are! In both cases, there will be confusing objects around - the challenge is to come up with the most plausible explanation for what is going on, in collaboration with the rest of the SpaceWarps community. Do you think you can spot outer space being warped? We do!"
    searching: "Searching in Stages"
    searching_text: "Each lens search has two stages. In the first one, we ask the community to 'spot' gravitational lens systems, with the emphasis on completeness. At this stage, we don't want to miss anything interesting! If in doubt, mark it and discuss it in Talk. In the second stage, 'refine', things are a little different: by this point, we'll have identified (together) several thousand lens candidates, and it's time to start refining this sample to identify the really promising ones. We want to reject the 'false positives', and focus on the objects that really look like lenses. We use the same interface - just with a more critical eye. The goal is to assemble, together, a small list of very good lens candidates for the Science Team to follow up with big telescopes. And big telescope time is not cheap, so we're after the very best lens candidates! You'll know which stage we are on by the color of the website: if it's blue, we're trying to spot the candidates, and if it's orange, we're trying to refine them."

    science_team: "Science Team"
    marshall_bio: "Phil is an astronomer at the University of Oxford Physics department. After deciding he liked doing maths and physics problems at school and university enough to want to make up his own questions, Phil did a PhD at Cambridge University on using gravitational lensing to map the distribution of dark matter in galaxy clusters. He then did several postdoctoral research jobs in California, using strong lenses to weigh galaxies, and investigating automated strong lens detection. He knows very well how hard it is to teach a robot to spot lenses - or at least, how hard it is to teach them not to be confused by large numbers of galaxies that are not lenses."
    verma_bio: "Aprajita is an astronomer at the University of Oxford, and previously worked at Imperial College London and the Max Planck Institute for Extraterrestrial Physics (Germany). She became fascinated by gravitational lenses during her PhD in which she studied some of the most luminous galaxies seen in the Universe, some of which have been gravitationally lensed. Aprajita is interested in making use of gravitational lenses as natural telescopes to study the galaxies that are being lensed in more detail than would normally be possible, as well as measuring the light and dark matter in the lensing galaxies themselves. Having worked with citizen scientists looking for gravitational lenses in Galaxy Zoo, she was inspired by their efforts, motivating the emergence of Space Warps."
    a_more_bio: "Anupreeta is a JSPS postdoctoral fellow at the Kavli IPMU in the University of Tokyo (Todai). She has been captivated by gravitational lenses ever since she first saw one. She likes to find these rare systems and study them to learn more about the mysterious dark matter and how it influences the galaxies hosted within. She's interested in developing better algorithms to find lens systems automatically in order to solve the &quot;needle in a haystack&quot; problem. She’s leading the first Space Warps project using data from the CFHT Legacy Survey. With the help of citizen scientists, she can find the lenses that were missed by her arc-finding algorithm which will help her improve the algorithm. This will be extremely useful when doing lens searches with future large imaging surveys."
    baeten_bio: "Els has always been interested in science, and astronomy in particular, but choices and career moves steered her in a very different direction. So, when she discovered GalaxyZoo, it was the chance of a lifetime to get seriously involved. This resulted in, among other things, moderating the discussion in several different projects (Solar StormWatch, Old Weather, IceHunters and recently for GalaxyZoo Talk) and classifying in many more. Before GalaxyZoo came along she had only some vague notions of what a gravitational lens was, but she quickly became intrigued by them and spent hours searching the SDSS images for potential lenses. She is looking forward to doing some serious lens hunting!"
    cornen_bio: "Claude was an IT development manager and is now retired after a long professional life in the French consumer loan business. He could then take his time reading, learning history of sciences and attending lectures on astrophysical topics. In volunteering on Zooniverse projects , he uses his ability in data mining to respond to calls for &quot;wanted&quot; objects in the Galaxy Zoo forum like &quot;peas&quot;, &quot;overlaps&quot;, &quot;AGN with ionized clouds&quot;, and &quot;strong gravitational lenses.&quot;"
    faure_bio: "Cécile is a former researcher in gravitational lensing, mostly known for her work on the COSMOS lens catalog. She is now retired from research. Nowadays, she actively participates in projects of science for the public in France."
    fohlmeister_bio: "Janine is astrophysicist at the University of Heidelberg. Since her undergraduate study in physics she has been fascinated by strong gravitational lens systems, and studied the effect during her PhD. She specialized in observing brightness variations of distant lensed quasars, and measuring their time delays. She found that galaxy clusters have the power to delay the light travel times between the different images of a background quasar by up to several years."
    gill_bio: "Mandeep is an observational cosmologist working at SLAC (Stanford University), with a collaborator affiliation also at CBPF in Rio de Janeiro. Having done early undergrad research at NASA, he turned his attention “inward” for some time and did his graduate training as an experimental particle physicist. Being lured back by the stars (and galaxies), he then did postdoctoral research in gravitational lensing in both the weak and strong regimes, focussing on weighing and counting galaxy clusters with the ultimate aim of helping the worldwide effort to figure out just what is driving the accelerated expansion of the Universe. He is also a member of the Dark Energy Survey collaboration."
    thomas_j_bio: "Thomas has a long background in both business and astronomy; the latter has become his lifelong passion. He is currently studying astronomy-related physics and mathematics and has studied many other subjects including planetary science, meteorology and geology. Thomas enjoys discussing and explaining difficult concepts in simple terms, to help ‘newbies’ in particular. He is attracted to deep space astronomy and can often be found chewing over the subject of dark matter."
    kueng_bio: "After doing a Bachelor’s degree in physics, Rafael is a Master’s student in Computational Science at the Institute of Theoretical Physics at University of Zurich. He works with Prasenjit on the reconstruction of identified gravitational lenses. For his Master’s thesis, he is writing a tool for further modeling already identified gravitational lenses, based on Jonathan Coles’ simulation program."
    macmillan_bio: "Christine, a planetarium presenter, participates in citizen science, classifying in Galaxy Zoo and posting in the forum. She has always been fascinated by the sky, starting with the Moon when a small child, then the solar system and stars, and then learning about galaxies and gravitational lenses in a natural progression of expanding horizons."
    s_more_bio: "Surhud is a long-term postdoctoral fellow at the Kavli-IPMU in the University of Tokyo (Todai). He wants to use gravitational lensing to learn about the formation and evolution of galaxies and the cosmological parameters of the Universe. He is interested in building statistically meaningful samples of strong gravitational lensing systems to achieve these goals."
    saha_bio: "Prasenjit is an astrophysicist at the University of Zurich, and is especially interested in reconstructing lenses: that means using what is observable on the sky (or in your Space Warps browser window) to figure out just how warped the space around the lens is, where the dark matter in the lensing galaxy or cluster would be, and what it can tell us about the Universe at large."
    tecza_bio: "Matthias is an astronomer at the University of Oxford with a specialisation in astronomical instrumentation for large telescopes. In particular, the instruments he builds can be used to study galaxy dynamics, that is, determining how stars and gas move within galaxies. Gravitational lenses are ideal subjects for such studies, delivering data on the lensing galaxies and the lensed background galaxies simultaneously. Matthias is interested in comparing the mass of the lensing galaxies from his dynamical measurements to those obtained from gravitational lensing."
    wilcox_bio: "Julianne stumbled across Galaxy Zoo several years ago following a report on BBC. Having been an avid amateur astronomer since childhood, she found the London skies somewhat lacklustre. After realising classifying galaxies was an excellent way to get back into astronomy, she has gone on to participate in many projects. Although not from a science background, she has found the Zooniverse to be an excellent way of learning new concepts, while making a valid contribution to science. When not glued to her PC participating in citizen science, she can be found testing and analysing software systems."
    wright_bio: "Layne is an electrical engineer with a physics background who became interested in gravitational lensing while participating in the Galaxy Zoo project. His focus shifted from primarily hunting lenses to modeling them after realizing that almost any galaxy cluster could host lensing of the most &quot;beautiful complexity&quot;. Since then, he has been actively creating software to help visualize these more exotic, &quot;multi-plane&quot; lenses."

    development_team: "Development Team"
    borden_bio: "Kelly is an archaeologist by training but an educator by passion. While working at the Museum of Science and Industry and the Adler Planetarium she became an enthusiastic science educator eager to bring science to the masses. When not pondering the wonders of science, Kelly can often be found baking or spending time with her herd of cats – Murray, Ada, & Kepler."
    kapadia_bio: "Amit joined the Zooniverse team at the Adler Planetarium in September of 2011. He comes from a background of physics and mathematics. He has worked for various astronomy outreach groups including three of NASA's Great Observatories."
    miller_bio: "As a visual communicator, David is passionate about tellings stories through clear, clean, and effective design. Before joining the Zooniverse team as Visual Designer, David worked for The Raindance Film Festival, the News 21 Initiative's Apart From War, Syracuse Magazine, and as a freelance designer for his small business, Miller Visual. David is a graduate of the S.I. Newhouse School of Public Communications at Syracuse University, where he studied Visual & Interactive Communications."
    parrish_bio: "Michael has a degree in Computer Science and has been working with The Zooniverse for the past three years as a Software Developer. Aside from web development; new technologies, science, AI, reptiles, and coffee tend to occupy his attention."
    smith_bio: "As an undergraduate, Arfon studied Chemistry at the University of Sheffield before completing his Ph.D. in Astrochemistry at The University of Nottingham in 2006. He worked as a senior developer at the Wellcome Trust Sanger Institute (Human Genome Project) in Cambridge before joining the Galaxy Zoo team in Oxford. Over the past 3 years he has been responsible for leading the development of a platform for citizen science called Zooniverse. In August of 2011 he took up the position of Director of Citizen Science at the Adler Planetarium where he continues to lead the software and infrastructure development for the Zooniverse."
  guide:
    heading: "Spotter's Guide"
    tagline: "This guide contains examples of real lenses and other astronomical objects that are typically mistaken for gravitational lenses, resulting in false positives."
    real_lenses: "Real Lenses"
    false_positives: "False Positives"
    lensed_galaxies: "Lensed Galaxies"
    lensed_quasars: "Lensed Quasars"
    group_lenses: "Group Lenses"
    
    lensed_galaxies_text_1: "In general, galaxies can be big (massive) or small (compact), with a clear shape or morphology (e.g. spiral and elliptical galaxies) or messy (e.g. irregular, clumpy and merging galaxies). As they are made up of many stars, galaxies generally appear to be extended in astronomical images, unlike single stars that just look like compact, round sources."
    lensed_galaxies_text_2: "Galaxies with lots of stars or mass can act as cosmic telescopes and bend light of a galaxy lying behind them into multiple images. Typically the most massive galaxies appear yellow-red in colour (the colour is indicative of old stars that are massive). They usually have a smooth distribution of light and are spherical or elliptical in shape. Similarly, the central bulges of large galaxies can be massive enough to cause lensing."
    lensed_galaxies_text_3: "When a distant galaxy (background source) is lensed by a galaxy lying between us and the galaxy, you can get multiple images of the galaxy that typically trace a circle around the lensing galaxy, see the examples below. The last example shows the case when the background source and the lensing galaxy almost exactly aligned along the of sight to us - this produces a lensed image that is a ring, usually referred to as an Einstein ring."
    lensed_galaxies_text_4: "If you look at the examples below you'll probably have already noticed that the lensed or distorted images tend to be blue rather than the yellow/red of the lensing galaxy. This is partly because more distant galaxies are more likely to be young and so they have a lot of young stars that predominantly create more energetic photons or blue light. In addition, distant galaxies are &quot;redshifted&quot; this means the light you actually see originated from a shorter or bluer wavelength. Hence distant galaxies tend to look blue. While this is typically true for most of the lenses you will see, if these objects are at very high redshift, it can be that the bright blue photons that are emitted are so far away that they actually arrive at earth at even longer wavelengths. These images will appear red in our colour composites. So don't reject red arcs or images - these could just be at high redshift!. There's an example of a high-redshift lensed quasar in lensed quasars."
    lensed_galaxies_text_5: "This faint blue galaxy is being magnified and distorted into an arc by the massive red galaxy. See how the arc curves around the lens. If you look closely there is a hint of a counter-image (a second image opposite side of the lens to the primary arc). It is the same colour as the primary arc but it is typically fainter. Because of this sometimes the counter image is bright enough to be seen but sometimes it's too faint to be seen."
    lensed_galaxies_text_6: "Very massive galaxies can cause multiple images to form. Here you see a blue arc and two additional blue images, these are arranged roughly on a circle around the lensing galaxy. This standard lens configuration is called the fold configuration."
    lensed_galaxies_text_7: "Very massive galaxies can cause multiple images to form, arranged roughly on a circle around themselves."
    lensed_galaxies_text_8: "In the very rare instance that a background galaxy is (almost perfectly) aligned to the foreground galaxy along the line of sight to us, the light of the background galaxy is deflected in all directions. This give rise to a ring-like lensed image and is called an Einstein Ring."
    lensed_galaxies_text_9: "Spiral galaxies are like fried eggs: the bulge of stars in the middle is the yolk, while the spiral arms lie in the thin layer of egg white. Imagine sticking two fried eggs to either side of a circle of cardboard, and then looking at the whole thing from the side. That's what an edge-on spiral galaxy looks like. These are not usually very massive but some of them can act as lenses. Above are some examples of how the edge-on lens systems look like."
    
    lensed_quasars_text_1: "Quasars or quasi-stellar objects are very compact galaxies that have very bright central regions that outshine the rest of the galaxy making it look &quot;star-like&quot;. The nucleus is so bright because it's massive and it's made up of millions of stars with a very massive black hole. As matter falls into the black hole it lights up making the nucleus very bright. When a compact object like a quasar is lensed by a galaxy that's lying between us and the quasar it is lensed into discrete multiple images like the examples shown below. Quasars are rare compared to galaxies and hence, lensed quasars are even rarer than lensed galaxies. Below the examples show quasars lensed by a single galaxy, quasars lensed by a galaxy group are even rarer. To date, only three quasars lensed by a galaxy group/cluster have been found."
    double: "Double"
    lensed_quasars_text_2: "This is a bright blue &quot;quasi-stellar object&quot; behind a massive galaxy: it has been lensed into two images, one on either side of the lens galaxy."
    quad: "Quad"
    lensed_quasars_text_3: "This quasar has been lensed into four images, arranged around the galaxy. This is called the Einstein cross configuration. Quads are about 6 times rarer than doubles."
    high_z: "High-z"
    lensed_quasars_text_4: "This is a quasar at high redshift, so it appears yellow-ish. The image configuration in this case is a quad, with two images very close together."
    
    group_lenses_text_1: "Galaxy groups and clusters are gravitationally bound entities. They mark the most massive regions in the Universe. As such these are the most powerful cosmic telescopes and can produce large and spectacular arcs and multiple images. See the examples below."
    group_lenses_text_2: "Groups or clusters of massive red galaxies can lens background galaxies into long, bright arcs. These arcs are typically less curved and at larger separations from the lensing galaxies than would be seen for a single lensing galaxy. This is because groups and clusters of galaxies are much more massive than a single galaxy and so the deflection of the image (or separation) can be larger."
    group_lenses_text_3: "Groups and clusters of massive galaxies can form many images, often of more than one background galaxy. The bright images curve around the entire lens that can be several galaxies."
    
    rings_spirals: "Star-forming galaxies"
    loners: "Loners"
    lightweights: "Lightweights"
    mergers_neighbors: "Mergers &amp; Neighbors"
    
    rings_spirals_text_1: "Star-forming galaxies are common and show a blue component of emission including spiral arms, a ring, or star-forming clumps. These are not massive galaxies but the active star-formation produces a lot of blue light. Spiral arms are a common feature, such as found in our own Milky Way. Ring galaxies may be formed by the interaction of two star-forming galaxies. Irregular and merging galaxies (those without a well defined shape) are often dominated by blue light from star-fromation. Depending on orientation, spiral arms and rings can look similar to gravitationally lensed images of a background galaxy, these are common false positives. They often have red bulges that can mimic a massive lensing galaxy; but the arms or rigns don't have the right shape to be lensed arcs. Sometimes star forming clumps in a galaxy can also be symmetrically arranged arounf the red core of a galaxy and resemble gravitationally lensed quasars. Some tips on how to distinguish these false positives from the real thing are below."
    rings_spirals_text_2: "These often have yellow &quot;bulges&quot; and blue &quot;spiral arms.&quot; Unlike gravitationally lensed arcs, the arms don't trace a rough circle around the bulge, and they are usually accompanied by some fuzzy distribution of light."
    rings_spirals_text_3: "Their yellow bulges are surrounded by complete, oval rings of blue light. In contrast, Einstein Rings are typically more circular, and brighter."
    
    isolated_blue: "Isolated Blue Irregular Galaxy"
    loners_text_1: "We have put a selection of objects that look like blue arcs in this page, however these are not gravitationally lensed systems. The easiest check is that there is no plausible massive gravitational lens in their vicinity. See below for some examples."
    loners_text_2: "Some faint blue galaxies appear arc-like. If there isn't a massive galaxy present, it's almost certainly not being lensed!"
    loners_text_3: "This example is very elongated, like a cluster arc - but there is no cluster of massive yellow galaxies present."
    blue_group: "Blue Group"
    loners_text_4: "Faint blue galaxies can appear in groups and clusters too, and sometimes the galaxies in those groups can look aligned in an arc shape so they look a bit like multiple lensed images - but with no lens!"
    
    lightweights_text_1: "As we described  previously, a galaxy needs to be massive to act as a gravitational lens. Spiral and irregular galaxies are not massive enough to cause strong gravitational lensing usually. However, there are some known cases of spiral galaxies (both seen face-on and edge-on) acting as gravitational lenses. While thinking about whether you are seeing gravitational lensing it's worthwhile considering if the object you think is the lens is massive enough or is it a &quot;lightweight&quot;? Do you see any other evidence that might disfavor lensing e.g. the lensed images are too far or the arc is too straight? Here are some examples."
    arclets: "Straight or Distant Arclets"
    lightweights_text_2: "Sometimes a yellow/red galaxy is present near a blue arc but its too small to create such a large or separated arc. The arc might appear too curved or curved in the wrong direction (it doesn't encircle the lensing galaxy). In the case above, the arc is too far away to be lensed by such a small galaxy."
    bulgeless_blue: "Bulgeless Blue Galaxies"
    lightweights_text_3: "The most massive galaxies have bulges of yellow/red stars – bulgeless, blue galaxies usually don't have enough mass to strongly deflect light. Such galaxies are less likely to act as lenses."
    
    mergers: "Mergers"
    neighbouring_galaxies: "Neighbouring Galaxies"
    mergers_neighbors_text_1: "As you may have seen in Galaxy Zoo, galaxies are moving objects that sometime collide and interact. This produces a single more massive galaxy at the end, but as the interaction is very complex and slow, spiral arms and star forming regions from both of the merging galaxies can be tidally distorted and drawn out. Usually, these merging galaxies can be identified due to their similar colors since such galaxies have roughly similar stellar population and ages. Below we give an example of how such mergers can be mistaken to be a lensing galaxy. Arms & tidal tails around the central redder bulge of the merging galaxies can end up looking similar to long blue arcs seen in lensing by galaxy groups."
    mergers_neighbors_text_2: "Sometimes two neighbouring galaxies, that aren't physically associated to each other, but are simply next to each other can look like a lens. This is just a chance or random alignment of galaxies. For lensing candidates remember to look for an arc that is defined and curved around a plausible lensing galaxy, and also look for hints of a counter image. If things look very nebulous & fuzzy or curved the wrong way, it's most likely this isn't a lens. Below we give examples of how such mergers or neighbours can be mistaken to be lensed systems."
    mergers_neighbors_text_3: "Two galaxies merging together can look a bit like a lens system. Here two spiral galaxies appear to be merging with multiple arms visible and a fuzzy distribution of light. Sometimes mergers cause displaced arms, or tidal tails. Unlike arcs, the arms or tidal tails do not trace a circle around the red bulge."
    mergers_neighbors_text_4: "Sometimes two neighbouring galaxies can look a bit like a lens system. In these cases, the supposed &quot;arc&quot; is usually not bright enough, it is not clearly defined or is fuzzy or the &quot;lens&quot; is not massive enough (as above)."
