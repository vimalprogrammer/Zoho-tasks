public class ParkSystem extends Main
{
  public static int totalNumberOfSlots;
  public int vsSize = 0;
  public int[] vacantSlots;
  public Vehicle[] occupiedSlots;

  public Vehicle[] getOccupiedSlots(){
      return occupiedSlots;
  }


  public void initilizeVacantSlots() 
  {
    vacantSlots = new int[totalNumberOfSlots];
    for (int i = 0; i < this.totalNumberOfSlots; i++)
      updateVacantSlots(i);
      
  }

  public void initilizeOccupiedSlots() 
  {
    occupiedSlots = new Vehicle[totalNumberOfSlots];
    for (int i = 0; i < totalNumberOfSlots; i++)
    {
      occupiedSlots[i] = null;
	//System.out.println(occupiedSlots[i]);
    }

  }

  public int getFirstVacantSlot(Vehicle vehicle) 
  {
    int slotNum=-1;
    if(vehType==2)
    {
        for(int i=0;i<20;i++)
        {
            if(occupiedSlots[i]==null)
            {
                slotNum=i;
                break;
            }
        }
    }
    else if(vehType==4)
    {
        for(int i=20;i<80;i++)
        {
            if(occupiedSlots[i]==null)
            {
                slotNum=i;
                break;
            }
        }
    } 
    return slotNum;
  }

  public void updateOccupiedSlots(int slot, Vehicle vehicle) 
  {
    if (slot == -1)
      return;
    occupiedSlots[slot] = vehicle;
  }

  public int allotSlot(Vehicle vehicle) 
  {
     for (int i = 0; i < 80; i++) 
     {
       if (occupiedSlots[i] != null && String.valueOf(occupiedSlots[i].getRegNo()).equals(String.valueOf(vehicle.getRegNo()))) 
         return -2;
     }
    int allotedSlot = getFirstVacantSlot(vehicle);
    updateOccupiedSlots(allotedSlot, vehicle);
    return allotedSlot;
  }

  public void createSlot(int n) 
  {
    totalNumberOfSlots = n;
    initilizeVacantSlots();
    initilizeOccupiedSlots();
  }

  public void updateVacantSlots(int element) 
  {
    vacantSlots[vsSize] = element;
    vsSize++;
  }

}