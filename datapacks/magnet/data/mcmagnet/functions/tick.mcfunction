#
# mcmagnet:tick

execute at @p if entity @p[nbt={SelectedItem:{tag:{magnet:1b}}}] if entity @e[type=item,distance=..6] run function mcmagnet:magnetize
