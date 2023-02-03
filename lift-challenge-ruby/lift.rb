def lift_sequence(queues, capacity)
  
  current_floor = 0
  travel_direction = "up"
  stops_requested = []
  output = [0]

  while queues.flatten.length > 0 || stops_requested.length > 0 #loop until no-one left in queues array

    if stops_requested.include?(current_floor) #checks if anyone waiting to get off and that stop 
      output.push(current_floor) #adds in stop record if someone getting off
      stops_requested.delete(current_floor) #removes all requests for this floor now people have gotten off
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
        queues[current_floor].delete_at(queues[current_floor].index(person) || queues[current_floor].length)
      end #Remove people from queues one at a time if they appear in passengers boarded list
    end




    if current_floor == queues.length-1  # turn lift down if it has reached the top
      travel_direction = "down"
    end

    if current_floor == 0 && travel_direction == "down"  # turn lift down if it has reached the top
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

