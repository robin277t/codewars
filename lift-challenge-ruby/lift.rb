def lift_sequence(queues, capacity)
  
  current_floor = 0
  travel_direction = "up"
  stops_requested = []
  output = [0]

  while queues.flatten.length > 0 || stops_requested.length > 0 #loop until no-one left in queues array
    # print queues.flatten.length
    if stops_requested.include?(current_floor) #checks if anyone waiting to get off and that stop 
      output.push(current_floor) #adds in stop record if someone getting off
      stops_requested.delete(current_floor) #removes all requests for this floor now people have gotten off
    end

    waiting_above = queues.slice(current_floor + 1, queues.length).flatten.length
    current_floor > 0 ? waiting_below = queues.slice(0, current_floor).flatten.length : waiting_below = 0

    queues[current_floor].length > 0 ? anyone_waiting_up = queues[current_floor].max : anyone_waiting_up = 0
    queues[current_floor].length > 0 ? anyone_waiting_down = queues[current_floor].min : anyone_waiting_down = 0

    if travel_direction == "up" && waiting_above + stops_requested.length == 0 && waiting_below != 0 && anyone_waiting_up < current_floor #TODO this last part needs to not be nil 
      # turn lift down if noone waiting above and it has emptied no one waiting at this floor going up
      travel_direction = "down"
    end
    
    #if lift going down and no more below but some above then turn up
    if travel_direction == "down" && waiting_below + stops_requested.length == 0 && waiting_above != 0 && anyone_waiting_down < current_floor 
       # turn lift up if no one waiting below and no one at this floor waiting to go down and some are waiting above
      travel_direction = "up"
    end

    if queues[current_floor].length > 0 #if someone waiting at floor
      passengers_boarded = []
            
      queues[current_floor].each do |person|  
        if travel_direction == 'up' && person > current_floor # if someone waiting to go up
          output.push(current_floor) if output[-1] != current_floor # add in that we've stopped to pick up if not already noted
          if stops_requested.length < capacity
            stops_requested.push(person) #add in higher floor to requested stops array
            passengers_boarded.push(person) #add in person who's boarded
          end
        end 
        if travel_direction == 'down' && person < current_floor || current_floor == queues.length-1 #if someone waiting to go down inc at top floor
          output.push(current_floor) if output[-1] != current_floor # add in that we've stopped to pick up if not already noted
          if stops_requested.length < capacity
            stops_requested.push(person) #add in lower floor to requested stops array
            passengers_boarded.push(person) #add in person who's boarded
          end
        end
      end

      passengers_boarded.each do |person| 
        queues[current_floor].delete_at(queues[current_floor].index(person))# || queues[current_floor].length)
      end #Remove people from queues one at a time if they appear in passengers boarded list
    end

    print "how many below: #{waiting_below} "
    
    #move life on in right direction
    case travel_direction
    when "up" 
      current_floor += 1
    when "down"
      current_floor -= 1
    end
    print "move #{travel_direction} to floor:#{current_floor} : "
  end

  output.push(0) if output[-1] != 0 # add in return to ground floor if it ever left and hasn't already returned
  return output

end

