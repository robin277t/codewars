def lift_sequence(queues, capacity)
  
  current_floor = 0
  travel_direction = "up"
  stops_requested = []
  output = [0]

  while queues.flatten.length > 0 || stops_requested.length > 0 #loop until no-one left in queues array / in the lift

    if stops_requested.include?(current_floor) #checks if anyone waiting to get off and that stop 
      output.push(current_floor) #adds in stop record if someone getting off
      stops_requested.delete(current_floor) #removes all requests for this floor now people have gotten off
    end

    current_floor < queues.length ? waiting_above = queues.slice(current_floor + 1, queues.length).flatten.length : waiting_above = 0
    current_floor > 0 ? waiting_below = queues.slice(0, current_floor).flatten.length : waiting_below = 0

    if queues[current_floor].length > 0 #if someone waiting at floor
      passengers_boarded = [] #temp array to delete people from queues

      if (travel_direction == 'up' && queues[current_floor].any? {|person| person > current_floor }) ||
        (travel_direction == 'down' && queues[current_floor].any? {|person| person < current_floor })
        output.push(current_floor) if output[-1] != current_floor # add in that we've stopped to pick up if not already noted
        i = 0
        while stops_requested.length < capacity && i < queues[current_floor].length
          person = queues[current_floor][i]
          if (travel_direction == 'up' && person > current_floor) || travel_direction == 'down' && person < current_floor
            stops_requested.push(person)  #add in floor to requested stops array
            passengers_boarded.push(person) #add in person who's boarded to temporary list
          end
          i += 1
        end
      end

      if (travel_direction == 'up' && waiting_above == 0 && !stops_requested.any? {|stop| stop > current_floor }) ||
        (travel_direction == 'down' && waiting_below == 0 && !stops_requested.any? {|stop| stop < current_floor })
        output.push(current_floor) if output[-1] != current_floor # add in that we've stopped to pick up if not already noted
        i = 0
        while stops_requested.length < capacity && i < queues[current_floor].length
          person = queues[current_floor][i]
            stops_requested.push(person)  #add in floor to requested stops array
            passengers_boarded.push(person) #add in person who's boarded to temporary list
          i += 1
        end
      end
           
      passengers_boarded.each do |person| 
        queues[current_floor].delete_at(queues[current_floor].index(person))# || queues[current_floor].length)
      end #Remove people from queues one at a time if they appear in passengers boarded list
    end

    if travel_direction == "up" && waiting_above == 0 && !stops_requested.any? {|stop| stop > current_floor } # turn lift down if noone waiting above and it has emptied no one waiting at this floor going up
      travel_direction = "down"
    end
    
    if travel_direction == "down" && waiting_below == 0 && !stops_requested.any? {|stop| stop < current_floor } # turn lift up if no one waiting below and no one at this floor waiting to go down and some are waiting above
       travel_direction = "up"
    end

    #move life on in right direction
    case travel_direction
    when "up" 
      current_floor += 1
    when "down"
      current_floor -= 1
    end
  end

  output.push(0) if output[-1] != 0 # add in return to ground floor if it ever left and hasn't already returned
  return output
end

