## Bill of materials

Here a list of parts I used in my machine

### Frame construction

The base frame consists mainly out of 20x20 and 40x20 profile elements.
You are free to use different lengths if you want your machine to be bigger or smaller.
I just made them that way so the base frame fits onto an Ikea Lack table which measures 550mm x 550mm.

#### Frame parts list

    4 * 550mm 40x20 profile 5
    6 *  70mm 40x20 profile 5
    4 * 510mm 20x20 profile 5

#### Table top

For the table top I used 120x15 profile 8. Many people use a steel sheet as a surface to use magnet holders for their PCBs and strip feeders.
But I decided to go with the profile 8 version so I can slide in those T-nuts for screwing down the PCB holders and the bottom camera.

With the 4 * 120mm width I get a gap of 30mm, which I decided to place it in the middle so the table is divided in two parts: PCs left, strip feeders right and the bottom camera and discard box in the middle.

    4 * 550m 15x120 profile 8

### Electronics

#### Controller board

For the time being I use a BTT SKR v1.4 board running the Marlin firmware with little modification for the LCD screen.
The stepper drivers are Trinamic silent step stick.

At a later stage I will design my own ctronller board more suitable for OpenPNP with separate power rails for steppers, lighting, valves and pumps based on a STM32F4 MCU.

    1 * BTT SKR v1.4 controller board
    4 * TMC5160 silent step stick for X, 2 * Y and Z
    1 * TMC2209 silent step stick for the pick head motor

