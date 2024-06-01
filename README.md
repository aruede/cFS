
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
cd build/exe/cpu1$
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
cd build/exe/cpu1/
../host/cmdUtil --endian=LE --pktid=0x1890 --cmdcode=4 --string=1:F
```

Change it back to Celsius
```
cd build/exe/cpu1/
../host/cmdUtil --endian=LE --pktid=0x1890 --cmdcode=4 --string=1:C
```

