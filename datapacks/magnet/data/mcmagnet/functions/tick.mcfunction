#
# mcmagnet:tick

execute at @p if entity @e[type=item,distance=..6] if entity @p[nbt={SelectedItem:{tag:{magnet:1b}}}] run function mcmagnet:magnetize
