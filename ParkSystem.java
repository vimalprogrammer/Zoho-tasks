class ParkSystem 
{
  private int totalNumberOfSlots;
  private int vsSize = 0;
  private int[] vacantSlots;
  private Car[] occupiedSlots;

  private void initilizeVacantSlots() 
  {
    vacantSlots = new int[totalNumberOfSlots];
    for (int i = 0; i < this.totalNumberOfSlots; i++)
      updateVacantSlots(i);
      
  }

  private void initilizeOccupiedSlots() 
  {
    occupiedSlots = new Car[totalNumberOfSlots];
    for (int i = 0; i < totalNumberOfSlots; i++)
      occupiedSlots[i] = null;
  }



  private int getFirstVacantSlot() 
  {
    if (this.vsSize == 0)
      return -1;
    int slotNumber = vacantSlots[0];
    vacantSlots[0] = vacantSlots[vsSize - 1];
    vsSize--;
    return slotNumber;
  }

  public void updateOccupiedSlots(int slot, Car car) 
  {
    if (slot == -1)
      return;

    if (car == null)
      updateVacantSlots(slot);
    occupiedSlots[slot] = car;
  }

  public int allotSlot(Car car) 
  {
    int allotedSlot = getFirstVacantSlot();
    updateOccupiedSlots(allotedSlot, car);
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
    if (vsSize >= totalNumberOfSlots)
      return;
    vacantSlots[vsSize] = element;
    vsSize++;
  }

  public void displayStatus() 
  {
    System.out.println();
    System.out.println("Slot No\t| Car");
    for (int i = 0; i < totalNumberOfSlots; i++) 
    {
      if (occupiedSlots[i] != null) 
        System.out.println(i + 1 + "\t| " + occupiedSlots[i].getRegNo());
    }
    System.out.println();
  }

  public int getSlotNumberOfCar(String regNo) 
  {
    for (int i = 0; i < totalNumberOfSlots; i++) 
    {
      if (occupiedSlots[i] != null && occupiedSlots[i].getRegNo().equalsIgnoreCase(regNo)) 
        return i;
    }
    return -1;
}
}