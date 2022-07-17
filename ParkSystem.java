public class ParkSystem 
{
  public int totalNumberOfSlots;
  public int vsSize = 0;
  public int[] vacantSlots;
  public Car[] occupiedSlots;


  public Car[] getOccupiedSlots(){
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
    occupiedSlots = new Car[totalNumberOfSlots];
    for (int i = 0; i < totalNumberOfSlots; i++)
      occupiedSlots[i] = null;
  }

  public int getFirstVacantSlot() 
  {
    if (this.vsSize == 0)
      return -1;
    int slotNumber = vacantSlots[totalNumberOfSlots - vsSize];
    // System.out.println(slotNumber);
    // System.out.println(vsSize);
    // System.out.println(totalNumberOfSlots);
    --vsSize;
    return slotNumber;
  }

  public void updateOccupiedSlots(int slot, Car car) 
  {
    if (slot == -1)
      return;
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
    vacantSlots[vsSize] = element;
    vsSize++;
  }

}