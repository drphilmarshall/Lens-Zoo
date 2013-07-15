
{Controller} = require 'spine'


class Annotation extends Controller
  svgns: 'http://www.w3.org/2000/svg'
  color: "#E05502"
  overColor: "#FF4500"
  selectColor: "#FF8C00"
  
  radius: 10
  p1: 6
  p2: 14
  
  # Store the state of the coordinate frame
  @zoom: 1
  @halfWidth: 220.5
  @halfHeight: 220.5
  @xOffset: -220.5
  @yOffset: -220.5
  
  # Class drag variable toggled when any instance is dragged
  @drag: false
  
  constructor: ->
    super
    @y -= @radius
    
    @dimension = 3.5 * @radius
    
    # Create SVG elements
    @gCross   = @initCross()
    @gBox     = @initBoundingBox()
    @gRemove  = @initRemove()
    
    # Create the root SVG group
    @gRoot = document.createElementNS(@svgns, "g")
    
    # Draw in local frame, transform and store in world frame
    @localToWorld(@x, @y)
    
    # Append elements to root group
    @gRoot.appendChild(@gBox)
    @gRoot.appendChild(@gCross)
    @gRoot.appendChild(@gRemove)
    
    # Append SVG to DOM
    @el[0].appendChild(@gRoot)
    
    # Set control parameters
    @drag = false
    @hasDragged = false
    @isRemoveVisible = false
    
    # Bind mouse events
    @el.bind('mousemove', @onmousemove)
    @el.bind('mouseenter', @onmouseenter)
    
    @gRoot.onmousedown  = @onmousedown
    @gRoot.onmouseup    = @onmouseup
    @gRoot.onclick      = @onclick
    @gRemove.onclick    = @remove
  
  initCross: ->
    
    # Create the crosshair SVG group
    gCross = document.createElementNS(@svgns, "g")
    gCross.setAttribute("stroke", @color)
    gCross.setAttribute("stroke-width", 2)
    gCross.setAttribute("fill-opacity", 0)
    
    # Create an SVG circle
    c = document.createElementNS(@svgns, "circle")
    c.setAttribute("r", @radius)
    
    # Create the crosshair
    l1 = document.createElementNS(@svgns, "line")
    l2 = document.createElementNS(@svgns, "line")
    l3 = document.createElementNS(@svgns, "line")
    l4 = document.createElementNS(@svgns, "line")
    
    l1.setAttribute("x1", @p1)
    l1.setAttribute("y1", 0)
    l1.setAttribute("x2", @p2)
    l1.setAttribute("y2", 0)
    
    l2.setAttribute("x1", -@p1)
    l2.setAttribute("y1", 0)
    l2.setAttribute("x2", -@p2)
    l2.setAttribute("y2", 0)
    
    l3.setAttribute("x1", 0)
    l3.setAttribute("y1", @p1)
    l3.setAttribute("x2", 0)
    l3.setAttribute("y2", @p2)
    
    l4.setAttribute("x1", 0)
    l4.setAttribute("y1", -@p1)
    l4.setAttribute("x2", 0)
    l4.setAttribute("y2", -@p2)
    
    # Append elements to crosshair group
    gCross.appendChild(c)
    gCross.appendChild(l1)
    gCross.appendChild(l2)
    gCross.appendChild(l3)
    gCross.appendChild(l4)
    
    return gCross
  
  initBoundingBox: ->
    
    # Create the bounding box group
    gBox = document.createElementNS(@svgns, "rect")
    gBox.setAttribute("width", @dimension)
    gBox.setAttribute("height", @dimension)
    gBox.setAttribute("x", -@dimension / 2)
    gBox.setAttribute("y", -@dimension / 2)
    gBox.setAttribute("fill-opacity", 0)
    gBox.setAttribute("cursor", "move")
    
    return gBox
    
  initRemove: ->
    
    # Create the remove SVG group
    gRemove = document.createElementNS(@svgns, "g")
    gRemove.setAttribute("transform", "translate(-#{@p2}, -#{@p2})")
    gRemove.setAttribute("class", "remove")
    gRemove.setAttribute("visibility", "hidden")
    
    # Create circle
    cRemove = document.createElementNS(@svgns, "circle")
    cRemove.setAttribute("r", @p1)
    cRemove.setAttribute("fill", "#FAFAFA")
    
    # Create bounding circle
    cBounding = document.createElementNS(@svgns, "circle")
    cBounding.setAttribute("r", 3 * @p1)
    cBounding.setAttribute("fill-opacity", 0)
    
    # Create an SVG text element
    tRemove = document.createElementNS(@svgns, "text")
    tRemove.textContent = "x"
    tRemove.setAttribute("font-size", 11)
    tRemove.setAttribute("font-weight", 700)
    tRemove.setAttribute("x", -@p1 / 2)
    tRemove.setAttribute("y", @p1 / 2)
    
    # Append elements to remove group
    gRemove.appendChild(cRemove)
    gRemove.appendChild(tRemove)
    gRemove.appendChild(cBounding)
    
    return gRemove
  
  # Coordinate transformation from pan-zoom frame to world frame
  localToWorld: (x, y) ->
    
    # Draw in pan-zoom frame
    @gRoot.setAttribute("transform", "translate(#{x}, #{y})")
    
    # Get transformation parameters
    halfWidth = Annotation.halfWidth
    halfHeight = Annotation.halfHeight
    zoom = Annotation.zoom
    
    # Get pan deltas
    deltaX = halfWidth + Annotation.xOffset
    deltaY = halfHeight + Annotation.yOffset
    
    # Store world coordinates
    @x = (x - halfWidth) / zoom + halfWidth - deltaX
    @y = (y - halfHeight) / zoom + halfHeight + deltaY
    
    return null
  
  # Coordinate transformation from world frame to pan-zoom frame. No input needed since world
  # coordinates always stored on instance.
  worldToLocal: ->
    
    # Get transformation parameters
    halfWidth = Annotation.halfWidth
    halfHeight = Annotation.halfHeight
    zoom = Annotation.zoom
    
    # Get pan deltas
    deltaX = halfWidth + Annotation.xOffset
    deltaY = halfHeight + Annotation.yOffset
    
    # Get local coordinates
    x = (@x + deltaX - halfWidth) * zoom + halfWidth
    y = (@y - deltaY - halfHeight) * zoom + halfHeight
    
    # Draw in pan-zoom frame (markers always drawn in pan-zoom frame)
    @gRoot.setAttribute("transform", "translate(#{x}, #{y})")
    
    return null
  
  #
  # Interaction functions
  #
  
  onmousemove: (e) =>
    e.preventDefault()
    return unless @drag
    
    @hasDragged = true
    
    # Hide the remove SVG
    @gRemove.setAttribute("visibility", "hidden")
    @trigger 'remove-off' if @isRemoveVisible
    @isRemoveVisible = false
    
    halfWidth = Annotation.halfWidth
    halfHeight = Annotation.halfHeight
    zoom = Annotation.zoom
    
    deltaX = halfWidth + Annotation.xOffset
    deltaY = halfHeight + Annotation.yOffset
    
    # TODO: Cache this.  Need to update on window resize!!!
    position = $('.subject.current .image').position()
    x = e.pageX - position.left
    y = e.pageY - position.top - @radius
    
    @x = (x - halfWidth) / zoom + halfWidth - deltaX
    @y = (y - halfHeight) / zoom + halfHeight + deltaY
    @gRoot.setAttribute("transform", "translate(#{x}, #{y})")
    
    # Broadcast the new position
    @trigger 'move', @x, @y
  
  onmouseenter: (e) =>
    e.preventDefault()
    
    return unless @drag
    @onmouseup(e)
  
  onmousedown: (e) =>
    e.preventDefault()
    
    @drag = Annotation.drag = true
    @gCross.setAttribute("stroke", @overColor)
  
  onmouseup: (e) =>
    e.preventDefault()
    @drag = Annotation.drag = false
    @gCross.setAttribute("stroke", @color)
  
  onclick: (e) =>
    e.preventDefault()
    @trigger 'click'
    
    if @isRemoveVisible
      @gRemove.setAttribute("visibility", "hidden")
      @gCross.setAttribute("stroke", @color)
      @trigger 'remove-off'
    else
      @gRemove.removeAttribute("visibility")
      @gCross.setAttribute("stroke", @selectColor)
      @trigger 'remove-on'
      
    @isRemoveVisible = not @isRemoveVisible
    
    if @hasDragged
      @gRemove.setAttribute("visibility", "hidden")
      @gCross.setAttribute("stroke", @color)
      @hasDragged = false
      @trigger 'remove-off'
      @isRemoveVisible = false
  
  toJSON: ->
    annotation =
      x: @x
      y: @y
    return annotation
  
  remove: =>
    $(@gRoot).remove()
    @trigger 'remove-off' if @isRemoveVisible
    @trigger 'remove', @


module.exports = Annotation