def lift_sequence(queues, capacity)
  
  current_floor = 0
  travel_direction = "up"
  stops_requested = []
  output = [0]

  while queues.flatten.length > 0 || stops_requested.length > 0 #loop until no-one left in queues array
    
    #break will need to change for repeated up and down
    if current_floor < 0 # end loop if returned down to ground
      break
    end

    #section below is for lift travelling up or down and not at top or bottom
    
    if queues[current_floor].length > 0 #if someone waiting at floor
      
      if travel_direction == 'up' && queues[current_floor][0] > current_floor # if someone waiting to go up
        output.push(current_floor) if current_floor > 0 # add in that we've stopped to pick up
        stops_requested.push(queues[current_floor][0]).uniq! #add in higher floor to requested stops array
        queues[current_floor].delete_at(0) # remove this person from queue
      end

      if travel_direction == 'down' && queues[current_floor][0] < current_floor || current_floor == queues.length-1 #if someone waiting to go down inc at top floor
        output.push(current_floor) # add in that we've stopped to pick up
        stops_requested.push(queues[current_floor][0]).uniq! #add in lower floor to requested stops array, doesn't care if a duplicate
        queues[current_floor].delete_at(0) # remove this person from queue
      end

    end

    if stops_requested.include?(current_floor) #checks if anyone waiting to get off and that stop 
      output.push(current_floor) if output[-1] != current_floor #adds in stop record if someone getting off but not already stopped to let on
      stops_requested.delete(current_floor) #removes all requests for this floor now people have gotten off
    end

      
    # if current_floor == queues.length-1 
    #   # remaining_floors = queues.drop(current_floor+1).flatten
    #   # puts remaining_floors.length
    # end

    if current_floor == queues.length-1 # turn lift down if it has reached the top
      travel_direction = "down"
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

