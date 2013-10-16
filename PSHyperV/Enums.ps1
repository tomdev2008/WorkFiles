Add-Type @" 


public enum VMState : int  
{
                    Paused = 32768,
                   Stopped = 3,
                   Running = 2,
                    Saving = 32773,
                  Stopping = 32774,
              Snapshotting = 32771,
                 Suspended = 32769,
                  Starting = 32770 
}
public enum ReturnCode : int  
{
                        OK = 0,
                JobStarted = 4096,
                    Failed = 32768, 
              AccessDenied = 32769,
              NotSupported = 32770,
                   Unknown = 32771,
                   Timeout = 32772,
          InvalidParameter = 32773,
               SystemInUse = 32774,
  InvalidStateForOperation = 32775,
         IncorrectDataType = 32776,
        SystemNotAvailable = 32777,
               OutOfMemory = 32778,
              FileNotFound = 32779
}
public enum BootMedia : int  
{
                       IDE = 2,
                    Floppy = 0,
                       NET = 3,
                        CD = 1 
}
public enum StartupAction : int  
{
                      None = 0,
               RestartOnly = 1,
             AlwaysStartup = 2 
}
public enum ShutdownAction : int  
{
                   TurnOff = 0,
                 SaveState = 1,
                  ShutDown = 2 
}
public enum RecoveryAction : int  
{
          RevertToSnapShot = 2,
                   Restart = 1,
                      None = 0 
}
public enum VHDType : int  
{
                   Dynamic = 3,
              Differencing = 4,
                     Fixed = 2,
             PhysicalDrive = 5 
}
public enum JobState : int  
{
                   Service = 11,
                Terminated = 8,
              ShuttingDown = 6,
                 Exception = 10,
                    Killed = 9,
                       New = 2,
                   Running = 4,
                 Completed = 7,
                 Suspended = 5,
                  Starting = 3 
}
public enum ResourceType : int  
{
                  iSCSIHBA = 8,
             StorageExtent = 21,
                  DVDDrive = 16,
                  IODevice = 13,
              ParallelPort = 18,
                     FCHBA = 7,
             USBController = 19,
             CoolingDevice = 29,
        FirewireController = 25,
                    Memory = 4,
                     IBHCA = 9,
                     Other = 1,
            ComputerSystem = 2,
     BasePartitionableUnit = 27,
               PowerSupply = 28,
             IDEController = 5,
                SerialPort = 17,
                      Tape = 23,
                 Processor = 3,
               FloppyDrive = 14,
         PartitionableUnit = 26,
           ParallelSCSIHBA = 6,
        OtherStorageDevice = 24,
                    IOSlot = 12,
                      Disk = 22,
           EthernetAdapter = 10,
        GraphicsController = 20,
       OtherNetworkAdapter = 11,
                   CDDrive = 15 
}
public enum HeartBeatICStatus : int  
{
               Unavailable = 32896,
                No_Contact = 12,
        Lost_Communication = 13,
                        OK = 2,
                     Error = 6 
}


public enum RemoteFxResoultion : int  
{
                  Display1024x768 = 0,
                 Display1280x1024 = 1,
                 Display1600x1200 = 2,
                 Display1920x1200 = 3 
}


"@ 
