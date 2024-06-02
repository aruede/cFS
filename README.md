
# Introduction

## How to get started

Run the setup script to autmatically set up the repositories and the make environment
```
./setup.py
```

Build the system
```
make install
```

## Example

Run the processor
```
cd build/exe/cpu1
./core-cpu1
```

Start the ground system GUI in another terminal
```
cd tools/cFS-GroundSystem
python3 GroundSystem.py
```

Select `Start Command System`, click on `Enable Tlm` and enter `127.0.0.1` as dest_IP parameter and send the command.

Now, after clicking the `Start Telemetry System` button you should see the TEC HK (TEC app house keeping) counter increasing. Clicking on `Display Page` we can see the counters and also the temperature with the temperature unit.

To change the house keeping temperature unit to Fahrenheit, open another terminal and manually send the command like this:
```
./build/exe/host/cmdUtil --endian=LE --pktid=0x1890 --cmdcode=4 --string=1:F
```

Change it back to Celsius
```
./build/exehost/cmdUtil --endian=LE --pktid=0x1890 --cmdcode=4 --string=1:C
```

### Multi processor example

In the targets.cmake we now have defined 3 different targets, called cpu1, cpu2, cpu3.
Each target can have a different applist. App listed under MISSION_GLOBAL_APPLIST are common to all targets.

By placing a file `cpu<n>_cfe_es_startup.scr` we can define the startup script for each target separately.

After following the normal build steps, start all 3 processors.

```
cd build/exe/cpu<n>
./core-cpu<n>
```

Each processor has a different Message ID, so to send the command to a specific processor its important to use the correct packet ID.
The `default_tec_msgids.h` is overwritten with the `cpu<n>_tec_msgids.h` placed in the `sample_defs` directory.

```
# cpu1
./build/exe/host/cmdUtil --endian=LE --pktid=0x1890 --cmdcode=4 --string=1:F
# cpu2
./build/exe/host/cmdUtil --endian=LE --pktid=0x1893 --cmdcode=4 --string=1:C
# cpu 3
./build/exe/host/cmdUtil --endian=LE --pktid=0x1896 --cmdcode=4 --string=1:F
```

You can verify the output at the corresponding terminal.
